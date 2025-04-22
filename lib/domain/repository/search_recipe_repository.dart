import 'package:recipe_app/domain/model/model.dart';

abstract interface class SearchRecipeRepository {
  Future<List<Recipe>> getRecipes();

  Future<void> saveRecipes(List<Recipe> recipes);
}
