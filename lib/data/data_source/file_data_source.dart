import 'package:recipe_app/data/dto/recipe_dto.dart';

abstract interface class FileDataSource {
  Future<void> saveRecentRecipes(List<RecipeDto> recipesDto);

  Future<List<RecipeDto>> getSavedRecentRecipes();
}
