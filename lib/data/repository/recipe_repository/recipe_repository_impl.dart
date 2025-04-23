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
    try {
      return await dataSource.getRecipes();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Recipe>> searchRecipes(String keyword) async {
    try {
      return await dataSource.searchRecipes(keyword);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleBookMarkRecipe(Recipe recipe) async {
    _recipes =
        _recipes.map((r) {
          return r == recipe
              ? recipe.copyWith(isBookMarked: !recipe.isBookMarked)
              : r;
        }).toList();
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    final all = await dataSource.getRecipes();
    return all.firstWhere((recipe) => recipe.id == id);
  }

  // Future<List<Procedure>> getProceduresByRecipe(String recipeId) async {
  //   final recipes = await dataSource.getRecipes();
  //   final recipe = recipes.firstWhere((recipe) => recipe.id == recipeId);
  //   return recipe.procedures;
  // }

  @override
  Future<List<RecipeIngredient>> getIngredientsByRecipe(int id) async {
    final recipes = await dataSource.getRecipes();
    final recipe = recipes.firstWhere((recipe) => recipe.id == id);
    return recipe.ingredients;
  }

  @override
  Future<List<Recipe>> getRecipesByIngredient(String ingredient) {
    // TODO: implement getRecipesByIngredient
    throw UnimplementedError();
  }
}
