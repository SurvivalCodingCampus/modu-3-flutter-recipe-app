import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/ingredient.dart';
import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/presentation/components/ingredient_item.dart';

class IngredientScreen extends StatelessWidget {
  const IngredientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Ingredient ingredient1 = Ingredient(
      id: 0,
      image: 'assets/images/tomatos.png',
      name: 'Tomatos',
    );
    final Ingredient ingredient2 = Ingredient(
      id: 1,
      image: 'assets/images/cabbage.png',
      name: 'Cabbage',
    );
    final Ingredient ingredient3 = Ingredient(
      id: 2,
      image: 'assets/images/taco.png',
      name: 'Taco',
    );
    final Ingredient ingredient4 = Ingredient(
      id: 3,
      image: 'assets/images/slice_bread.png',
      name: 'Slice Bread',
    );
    final Ingredients ingredients1 = Ingredients(ingredient: ingredient1, amount: 500);
    final Ingredients ingredients2 = Ingredients(ingredient: ingredient2, amount: 300);
    final Ingredients ingredients3 = Ingredients(ingredient: ingredient3, amount: 1234);
    final Ingredients ingredients4 = Ingredients(ingredient: ingredient4, amount: 987);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Ingredient 컴포넌트')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  IngredientItem(ingredients: ingredients1),
                  SizedBox(height: 12),
                  IngredientItem(ingredients: ingredients2),
                  SizedBox(height: 12),
                  IngredientItem(ingredients: ingredients3),
                  SizedBox(height: 12),
                  IngredientItem(ingredients: ingredients4),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
