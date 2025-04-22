import 'package:recipe_app/data/data_source/file_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

class FileDataSourceImpl implements FileDataSource {
  List<RecipeDto> _savedRecipesDto = [];

  @override
  Future<void> saveRecentRecipes(List<RecipeDto> recipesDto) async {
    _savedRecipesDto = recipesDto;
  }

  @override
  Future<List<RecipeDto>> getSavedRecentRecipes() async {
    return await Future.value(_savedRecipesDto);
  }
}
