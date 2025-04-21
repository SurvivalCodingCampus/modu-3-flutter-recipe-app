import 'package:recipe_app/data/dto/dto.dart';

abstract interface class LocalSearchRecipeDataSource {
  Future<List<RecipeDto>> getRecipes();

  Future<void> saveRecipes(List<RecipeDto> datas);
}
