import 'package:recipe_app/feature/receipe/domain/data_source/search/search_recipe_data_source.dart';
import 'package:recipe_app/feature/receipe/domain/dto/recipe_dto.dart';

class RecipeDataSourceImpl implements SearchRecipeDataSource {
  @override
  Future<List<RecipeDto>> getRecipes() {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }
}
