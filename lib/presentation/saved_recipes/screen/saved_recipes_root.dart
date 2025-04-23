import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';

class SavedRecipeRoot extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  final void Function(int value) onCardClick;

  const SavedRecipeRoot({
    super.key,
    required this.viewModel,
    required this.onCardClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (BuildContext context, Widget? child) {
        if (viewModel.state.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return SavedRecipeScreen(
          recipes: viewModel.state,
          onAction: (action) {
            switch (action) {
              case OnCardClick():
                onCardClick(action.cardId);
              case OnBookmarkClick():
                viewModel.action(action);
              case FindRecipes():
                viewModel.action(action);
            }
          },
        );
      },
      listenable: viewModel,
    );
  }
}
