import 'package:recipe_app/data/model/procedure_model.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';

import '../../model/ingredients_model.dart';
import '../../model/recipe_ingredient.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final List<Recipe> _recipes = [];

  MockRecipeRepositoryImpl() {
    _recipes.addAll([
      Recipe(
        category: 'Category 1',
        name: 'Recipe 1',
        imageUrl: 'image_url_1',
        chef: 'Chef 1',
        time: '10 min',
        rating: 4.5,
        isBookMarked: false,
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
        isBookMarked: false,
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
        isBookMarked: false,
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
    ]);
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(Duration(seconds: 1));
    return _recipes;
  }

  @override
  Future<List<Recipe>> searchRecipes(String keyword) async {
    await Future.delayed(Duration(seconds: 1));
    return _recipes.where((recipe) => recipe.name.contains(keyword)).toList();
  }

  @override
  Future<void> toggleBookMarkRecipe(Recipe recipe) async {
    final index = _recipes.indexWhere((r) => r == recipe);
    if (index != -1) {
      final updated = recipe.copyWith(isBookMarked: !recipe.isBookMarked);
      _recipes[index] = updated;
    }
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return _recipes.firstWhere((recipe) => recipe.id == id);
  }

  @override
  Future<List<RecipeIngredient>> getIngredientsByRecipe(int id) async {
    await Future.delayed(Duration(seconds: 1));
    final recipe = await getRecipeById(id);
    return recipe.ingredients;
  }

  @override
  Future<List<Recipe>> getRecipesByIngredient(String ingredient) {
    // TODO: implement getRecipesByIngredient
    throw UnimplementedError();
  }

  // @override
  // Future<List<Procedure>> getProceduresByRecipe(String recipeId) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   final recipe = await getRecipeById(recipeId);
  //   return recipe.procedures;
  // }
}
