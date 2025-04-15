import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/widgets/recipe_card.dart';
import 'package:recipe_app/presentation/component/pages/recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/app_text_styles.dart';

class RecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const RecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Saved Recipes',
          style: AppTextStyles.mediumBold(color: Colors.black),
        ),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final state = viewModel.state;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final recipes = state.filteredRecipes;

          if (recipes.isEmpty) {
            return const Center(child: Text("저장된 레시피가 없습니다."));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RecipeCard(
                  recipeName: recipe.name,
                  chefName: recipe.chef,
                  recipeImgUrl: recipe.image,
                  recipeTime: int.tryParse(recipe.time.replaceAll(RegExp(r'[^0-9]'), '')) ?? 20,
                  recipeRating: recipe.rating ?? 4.0,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
