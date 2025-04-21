import 'package:recipe_app/data/dto/dto.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> getRecipes();
}
