import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> getRecipe(int recipeId);
  Future<List<Recipe>> getSearchRecipes(); // 레시피 조회
  Future<List<Recipe>> saveSearchRecipes(List<Recipe> recipes); // 검색한 레시피 저장
  Future<List<Recipe>> filterSearchRecipes({
    // 필터링 포함
    required List<Recipe> recipes,
    required String keyword,
    required double rate,
    required Time sortTime,
    required Category category,
  });
}
