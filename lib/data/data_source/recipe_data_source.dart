import 'package:recipe_app/data/dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> fetchSavedRecipes();

  Future<RecipeDto> toggleFavorite(String id);
}
