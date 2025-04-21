import 'package:recipe_app/feature/receipe/data/dto/recipe_dto.dart';

abstract interface class SearchRecipeDataSource {
  Future<List<RecipeDto>> getRecipes();

  Future<List<String>> getRecentSearchText();

  Future<void> saveRecentSearchText(String text);
}
