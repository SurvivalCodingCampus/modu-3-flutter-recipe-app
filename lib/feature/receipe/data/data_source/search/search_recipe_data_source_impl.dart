import 'package:recipe_app/feature/receipe/data/data_source/search/search_recipe_data_source.dart';
import 'package:recipe_app/feature/receipe/data/dto/recipe_dto.dart';

class RecipeDataSourceImpl implements SearchRecipeDataSource {
  @override
  Future<List<RecipeDto>> getRecipes() {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getRecentSearchText() {
    // TODO: implement getRecentSearchText
    throw UnimplementedError();
  }

  @override
  Future<void> saveRecentSearchText(String text) {
    // TODO: implement saveRecentSearchText
    throw UnimplementedError();
  }
}
