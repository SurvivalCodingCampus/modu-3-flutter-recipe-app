import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/text_style.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Saved recipes", style: TextStyles.mediumTextBold),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 24),
                if (state.isLoading)
                  const Center(child: CircularProgressIndicator()),
                if (!state.isLoading && state.recipes.isEmpty)
                  const Center(child: Text("저장된 레시피가 없습니다.")),
                for (final recipe in state.recipes) ...[
                  GestureDetector(
                    onTap: () {
                      // context.push("/ingredient/${recipe.recipeId}");
                      onAction(SavedRecipesAction.onTapRecipe(recipe.recipeId));
                    },
                    child: RecipeCard(
                      recipe: recipe,
                      isBig: true,
                      isBookmarked:
                          state.bookMarkList.contains(recipe.recipeId)
                              ? true
                              : false,
                      isIngredient: false,
                      bookMarkCallback: () async {
                        // await viewModel.bookmarkRecipe(recipe.recipeId);
                        onAction(
                          SavedRecipesAction.onTapBookmark(recipe.recipeId),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
