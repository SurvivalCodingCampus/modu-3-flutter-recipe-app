import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/home/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved recipes'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            if (viewModel.isLoding) {
              return CircularProgressIndicator();
            }
            return Column(
              children:
                  viewModel.recipes
                      .map((recipe) => RecipeCard(recipe: recipe))
                      .toList(),
            );
          },
        ),
      ),
    );
  }
}
