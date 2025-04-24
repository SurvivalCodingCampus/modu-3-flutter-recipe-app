import 'package:recipe_app/domain/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> getRecipe(int recipeId);
  Future<List<Recipe>> getSearchRecipes(); // 레시피 조회
  Future<List<Recipe>> saveSearchRecipes(List<Recipe> recipes); // 검색한 레시피 저장
}
