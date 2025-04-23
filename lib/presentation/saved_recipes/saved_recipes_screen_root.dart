import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SavedRecipesScreen(
          state: widget.viewModel.state,
          onAction: (action) {
            switch (action) {
              case OnTapRecipe():
                context.push("/ingredient/${action.recipeId}");

              case OnTapBookmark():
                widget.viewModel.bookmarkRecipe(action.recipeId);
            }
          },
        );
      },
    );
  }
}
