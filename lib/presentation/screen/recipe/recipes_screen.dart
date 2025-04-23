import 'package:flutter/material.dart';
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/presentation/widget/recipe_card.dart';
import 'package:recipe_app/presentation/screen/recipe/recipes_state.dart';

class RecipesScreen extends StatelessWidget {
  final RecipesState state;
  final Future<void> Function(Recipe recipe) onBookmarkToggle;
  final void Function(Recipe recipe) onTapRecipe;

  const RecipesScreen({
    super.key,
    required this.state,
    required this.onBookmarkToggle,
    required this.onTapRecipe,
  });

  @override
  Widget build(BuildContext context) {
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
            onBookmarkTap: () => onBookmarkToggle(recipe),
            onTap: () => onTapRecipe(recipe),
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
