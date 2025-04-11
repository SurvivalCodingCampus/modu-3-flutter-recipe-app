import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/ui.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Recipes',
          style: TextStyles.mediumTextBold.copyWith(
            color: ColorStyles.labelColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return RecipeCard(recipe: viewModel.savedRecipes[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: viewModel.savedRecipes.length,
            );
          },
        ),
      ),
    );
  }
}
