import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/routing/router_path.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/presentation/screen/recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/widget/recipe_card.dart'; // 카드 위젯

class RecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const RecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.init(), // ✅ 여기서 한 번만 호출
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Saved recipes',
              style: AppTextStyles.mediumBold(color: Colors.black),
            ),
          ),
          body: ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              final state = viewModel.state;

              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              final recipes = state.filteredRecipes;

              if (recipes.isEmpty) {
                return const Center(child: Text("저장된 레시피가 없습니다."));
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final uiModel = recipes[index];
                  final recipe = uiModel.recipe;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: RecipeCard(
                      recipeName: recipe.name,
                      chefName: recipe.chef,
                      recipeImgUrl: recipe.image,
                      recipeTime: _extractMinutes(recipe.time),
                      recipeRating: recipe.rating,
                      isBookmarked: uiModel.isBookmarked,
                      onBookmarkTap: () async {
                        await viewModel.toggleBookmark(recipe);
                      },
                      onTap: () {
                        context.push(RouterPath.ingredient, extra: recipe);
                      },
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  int _extractMinutes(String time) {
    final match = RegExp(r'\d+').firstMatch(time);
    return match != null ? int.parse(match.group(0)!) : 0;
  }
}
