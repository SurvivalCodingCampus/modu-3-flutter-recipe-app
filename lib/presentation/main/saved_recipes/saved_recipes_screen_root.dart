import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreenRoot extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, snapshot) {
        return SavedRecipesScreen(
          state: viewModel.state,
          onAction: (SavedRecipesAction action) {
            switch (action) {
              case OnBookmark():
                viewModel.toggleBookmark(action.id);
              case OnRecipeClick():
                context.push(
                  Routes.ingredient.replaceAll(
                    ':recipeId',
                    action.id.toString(),
                  ),
                );
            }
          },
        );
      },
    );
  }
}
