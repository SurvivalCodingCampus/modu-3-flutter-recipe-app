import 'package:recipe_app/data/model/procedure_model.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';

import '../../model/ingredients_model.dart';
import '../../model/recipe_ingredient.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Recipe(
        category: 'Category 1',
        name: 'Recipe 1',
        imageUrl: 'image_url_1',
        chef: 'Chef 1',
        time: '10 min',
        rating: 4.5,
        ingredients: [
          RecipeIngredient(
            ingredient: Ingredient(id: 1, name: '소금', imageUrl: 'salt.png'),
            amount: 10,
          ),
        ],
        procedures: [
          Procedure(recipeId: 1, steps: ['Step 1', 'Step 2']),
        ],
        id: 1,
      ),
      Recipe(
        category: 'Category 2',
        name: 'Recipe 2',
        imageUrl: 'image_url_2',
        chef: 'Chef 2',
        time: '20 min',
        rating: 4.2,
        ingredients: [
          RecipeIngredient(
            ingredient: Ingredient(id: 2, name: '소금', imageUrl: 'salt.png'),
            amount: 10,
          ),
        ],
        procedures: [
          Procedure(recipeId: 2, steps: ['Step 1', 'Step 2']),
        ],
        id: 2,
      ),
      Recipe(
        category: 'Category 3',
        name: 'Recipe 3',
        imageUrl: 'image_url_3',
        chef: 'Chef 3',
        time: '30 min',
        rating: 4.8,
        ingredients: [
          RecipeIngredient(
            ingredient: Ingredient(id: 3, name: '소금', imageUrl: 'salt.png'),
            amount: 10,
          ),
        ],
        procedures: [
          Procedure(recipeId: 3, steps: ['Step 1', 'Step 2']),
        ],
        id: 3,
      ),
    ];
  }
}
