import 'package:recipe_app/recipe_app/data/model/recipe.dart';

abstract class FilterCategoryRepository {
  //북마크 된 레시피 가져 오는 메서드
  Future<List<Recipe>> filterRecipesByCategory(int rate, String category);
}
