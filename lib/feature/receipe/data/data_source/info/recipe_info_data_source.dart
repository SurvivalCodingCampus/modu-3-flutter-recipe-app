import 'package:recipe_app/feature/receipe/data/dto/recipe_dto.dart';

abstract interface class RecipeInfoDataSource {
  Future<RecipeDto> getRecipeInfo(int id);
}
