import 'package:flutter/material.dart';
import 'package:recipe_app/model/ingredient.dart';
import 'package:recipe_app/model/ingredients.dart';
import 'package:recipe_app/model/picture.dart';
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
            id: 1,
            title: 'title',
            chef: 'Uj jun',
            ingredients: [
              Ingredients(
                ingredient: Ingredient(
                  id: '2',
                  name: 'hihi',
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
                ),
                amount: 500,
              ),
            ],
            picture: Picture(
              id: 1,
              imageUrl:
                  'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
              thumbnailUrl: '',
              videoUrl: '',
            ),
            rate: 3.0,
            cookingTime: 20,
          ),

          Recipe(
            id: 1,
            title: 'title',
            chef: 'Uj jun',
            ingredients: [
              Ingredients(
                ingredient: Ingredient(
                  id: '2',
                  name: 'hihi',
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
                ),
                amount: 500,
              ),
            ],
            picture: Picture(
              id: 1,
              imageUrl:
                  'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
              thumbnailUrl: '',
              videoUrl: '',
            ),
            rate: 3.0,
            cookingTime: 20,
          ),
          Recipe(
            id: 1,
            title: 'title',
            chef: 'Uj jun',
            ingredients: [
              Ingredients(
                ingredient: Ingredient(
                  id: '2',
                  name: 'hihi',
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
                ),
                amount: 500,
              ),
            ],
            picture: Picture(
              id: 1,
              imageUrl:
                  'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
              thumbnailUrl: '',
              videoUrl: '',
            ),
            rate: 3.0,
            cookingTime: 20,
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
