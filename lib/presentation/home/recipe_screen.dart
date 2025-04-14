import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/widgets/recipe_card.dart';
import 'package:recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/app_text_styles.dart'; // RecipeCard 위젯 경로를 실제 경로로 변경해주세요

class RecipeScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const RecipeScreen({super.key, required this.viewModel});

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
          final recipes = viewModel.recipes;
          if (recipes.isEmpty) {
            return const Center(child: CircularProgressIndicator());
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
                  recipeTime: int.tryParse(recipe.time.replaceAll(RegExp(r'[^0-9]'), '')) ?? 20, // "20 min" -> 20
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