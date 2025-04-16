import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_view_model.dart';

class RecipeIngredientScreen extends StatelessWidget {
  final RecipeIngredientViewModel viewModel;

  const RecipeIngredientScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
        ],
      ),
      body: Center(child: Text(viewModel.recipeId.toString()))
    );
  }
}
