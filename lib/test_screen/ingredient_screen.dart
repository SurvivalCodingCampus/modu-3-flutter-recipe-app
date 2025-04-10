import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/presentation/component/ingredient_component.dart';

class IngredientScreen extends StatelessWidget {
  const IngredientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Ingredient ingredient1 = Ingredient(
      id: 'testId',
      imageUrl:
          '/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/images/tomatos.png',
      name: 'Tomatos',
      weight: 500,
    );
    final Ingredient ingredient2 = Ingredient(
      id: 'testId',
      imageUrl:
          '/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/images/cabbage.png',
      name: 'Cabbage',
      weight: 300,
    );
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
                  IngredientComponent(ingredient: ingredient1),
                  SizedBox(height: 12),
                  IngredientComponent(ingredient: ingredient2),
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
