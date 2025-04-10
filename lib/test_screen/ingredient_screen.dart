import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';

class IngredientScreen extends StatelessWidget {
  const IngredientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Ingredient ingredient1 = Ingredient(
      id: 'tomato_id',
      imageUrl: 'assets/images/tomatos.png',
      name: 'Tomatos',
      weight: 500,
    );
    final Ingredient ingredient2 = Ingredient(
      id: 'cabbage_id',
      imageUrl: 'assets/images/cabbage.png',
      name: 'Cabbage',
      weight: 300,
    );
    final Ingredient ingredient3 = Ingredient(
      id: 'taco_id',
      imageUrl: 'assets/images/taco.png',
      name: 'Taco',
      weight: 1234,
    );
    final Ingredient ingredient4 = Ingredient(
      id: 'slice_bread_id',
      imageUrl: 'assets/images/slice_bread.png',
      name: 'Slice Bread',
      weight: 987,
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
                  IngredientItem(ingredient: ingredient1),
                  SizedBox(height: 12),
                  IngredientItem(ingredient: ingredient2),
                  SizedBox(height: 12),
                  IngredientItem(ingredient: ingredient3),
                  SizedBox(height: 12),
                  IngredientItem(ingredient: ingredient4),
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
