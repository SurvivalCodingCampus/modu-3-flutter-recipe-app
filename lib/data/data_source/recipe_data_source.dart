import 'package:recipe_app/data/dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  // 레시피 목록 가져오기
  Future<List<RecipeDto>> getRecipeDtos();

  // 레시피 단일 가져오기
  Future<RecipeDto> getRecipeDto(int recipeId);
}
