// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final state = widget.viewModel.state;

        if (state.errorMessage != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                duration: const Duration(seconds: 2),
              ),
            );
            widget.viewModel.clearError(); // 메시지 보여준 후 에러 초기화
          });
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Saved recipes', style: AppTextStyles.mediumBold()),
          ),
          body: switch (state.recipes) {
            UiLoading() => const Center(child: CircularProgressIndicator()),

            UiSuccess(data: final recipes) => ListView.separated(
              itemCount: recipes.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return SizedBox(
                  height: 150,
                  child: RecipeCard(
                    title: recipe.name,
                    imagePath: recipe.image,
                    cookTime: recipe.time,
                    authorName: recipe.chef,
                    rating: recipe.rating,
                    isFavorite: true,
                    onTap: () async {
                      await context.push(Routes.ingredientPath(recipe.id));
                      widget.viewModel.load();
                    },
                    onFavoriteTap: () {
                      widget.viewModel.toggleBookmark(recipe.id);
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
            ),

            UiEmpty() => const Center(child: Text('저장된 레시피가 없습니다.')),

            UiError(message: final msg) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('에러 발생: $msg'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: widget.viewModel.load,
                    child: const Text('다시 시도'),
                  ),
                ],
              ),
            ),
          },
        );
      },
    );
  }
}
