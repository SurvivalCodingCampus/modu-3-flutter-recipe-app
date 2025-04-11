import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SavedRecipesScreen(
        recipe: [
          Recipe(
            id: '1',
            title: 'title',
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
            rate: 3.0,
            cookingTime: 20,
          ),
          Recipe(
            id: '2',
            title: 'pizza',
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
            rate: 3.0,
            cookingTime: 20,
          ),
          Recipe(
            id: '3',
            title: 'hamburger',
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
            rate: 3.0,
            cookingTime: 20,
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
