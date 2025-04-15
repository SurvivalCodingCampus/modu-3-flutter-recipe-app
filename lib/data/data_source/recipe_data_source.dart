import 'package:recipe_app/data/dto/recipe_dto.dart';

abstract interface class RecipeDataSource {
  // 레시피 목록 가져오기
  Future<List<RecipeDto>> getRecipeDto();

  // 검색어로 레시피 목록 가져오기
  Future<List<RecipeDto>> getSearchRecipeDto(String keyword);
}
