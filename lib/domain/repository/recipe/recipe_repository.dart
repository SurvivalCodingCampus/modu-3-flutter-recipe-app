import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> getRecipe(int recipeId);
  Future<List<Recipe>> getSearchRecipes(String inputText);
  Future<List<Recipe>> getFilterRecipes(
    CategoryType category,
    Star star,
    Time time,
    String inputText,
  );
  Future<List<Recipe>> getRecentRecipes();
  Future<void> saveRecentRecipes(List<int> ids);
}
