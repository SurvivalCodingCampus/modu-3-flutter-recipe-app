import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';

class SavedRecipeRoot extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipeRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (BuildContext context, Widget? child) {
        if (viewModel.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return SavedRecipeScreen(
          recipes: viewModel.recipes,
          onBookmarkClick: () {},
        );
      },
      listenable: viewModel..findRecipes(),
    );
  }
}
