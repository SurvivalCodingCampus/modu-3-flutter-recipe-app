import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';

import '../../data_source/recipe/recipe_data_source.dart';
import '../../model/recipe_ingredient.dart';
import '../../model/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource dataSource;
  List<Recipe> _recipes = [];

  RecipeRepositoryImpl(this.dataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    if (_recipes.isEmpty) {
      _recipes = await dataSource.getRecipes();
    }
    return _recipes;
  }

  @override
  Future<List<Recipe>> searchRecipes(String keyword) async {
    if (_recipes.isEmpty) {
      _recipes = await dataSource.getRecipes();
    }
    return _recipes.where((r) => r.name.contains(keyword)).toList();
  }

  @override
  Future<void> toggleBookMarkRecipe(Recipe recipe) async {
    _recipes =
        _recipes.map((r) {
          return r.id == recipe.id
              ? r.copyWith(isBookMarked: !r.isBookMarked)
              : r;
        }).toList();
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    if (_recipes.isEmpty) {
      _recipes = await dataSource.getRecipes();
    }
    return _recipes.firstWhere((recipe) => recipe.id == id);
  }

  @override
  Future<List<RecipeIngredient>> getIngredientsByRecipe(int id) async {
    final recipe = await getRecipeById(id);
    return recipe.ingredients;
  }

  @override
  Future<List<Recipe>> getRecipesByIngredient(String ingredient) async {
    if (_recipes.isEmpty) {
      _recipes = await dataSource.getRecipes();
    }
    return _recipes
        .where(
          (r) =>
              r.ingredients.any((i) => i.ingredient.name.contains(ingredient)),
        )
        .toList();
  }
}
