import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel..fetchAll(),
      builder: (context, child) {
        if (viewModel.state.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Recipes'),
              centerTitle: true,
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Saved Recipes'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: viewModel.state.recipes.length,
              itemBuilder: (context, index) {
                final Recipe recipe = viewModel.state.recipes[index];

                return RecipeCard(
                  title: recipe.name,
                  cookTime: recipe.cookTime,
                  imagePath: recipe.imageUrl,
                  author: recipe.chef,
                  rating: recipe.rating.toInt(),
                  onBookmark: () {},
                );
              },
            ),
          ),
        );
      },
    );
  }
}
