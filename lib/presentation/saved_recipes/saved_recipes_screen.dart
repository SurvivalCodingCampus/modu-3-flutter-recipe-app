import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

import '../component/recipe_card.dart';

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
    return ListView.separated(
      itemBuilder: (context, index) {
        final recipe = state.recipes[index];
        return GestureDetector(
          onTap:
              () =>
                  onAction(SavedRecipesAction.onTapCard(int.parse(recipe.id))),
          behavior: HitTestBehavior.opaque,
          child: RecipeCard(
            recipe: recipe,
            onTap:
                () => onAction(
                  SavedRecipesAction.onTapSave(int.parse(recipe.id)),
                ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: state.recipes.length,
    );
  }
}
