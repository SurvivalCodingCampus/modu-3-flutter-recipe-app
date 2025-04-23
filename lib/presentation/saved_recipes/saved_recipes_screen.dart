// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/recipe_component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesState state;
  final void Function(SavedRecipesAction action) onAction;

  const SavedRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    if (state.errorMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage!),
            duration: const Duration(seconds: 2),
          ),
        );
        onAction(const SavedRecipesAction.onClearError());
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
                onTap: () => onAction(SavedRecipesAction.onTapRecipe(recipe)),
                onFavoriteTap:
                    () => onAction(SavedRecipesAction.onTapFavorite(recipe.id)),
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
                onPressed: () => onAction(const SavedRecipesAction.onRetry()),
                child: const Text('다시 시도'),
              ),
            ],
          ),
        ),
      },
    );
  }
}
