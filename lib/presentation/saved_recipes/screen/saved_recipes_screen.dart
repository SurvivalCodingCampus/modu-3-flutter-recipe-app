import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipesState recipes;
  final void Function(SavedRecipesAction action) onAction;

  const SavedRecipeScreen({
    super.key,
    required this.recipes,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Recipes', style: AppTextStyles.mediumBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return RecipeCard(
              onCardClick: (value) {
                onAction(SavedRecipesAction.onCardClick(value));
              },
              onBookmarkClick: (value) {
                onAction(SavedRecipesAction.onBookmarkClick(value));
              },
              recipe: recipes.recipes[index],
            );
          },
          itemCount: recipes.recipes.length,
        ),
      ),
    );
  }
}
