import '../../data/model/recipe.dart';

abstract class SelectCategoryRepository {
  //북마크 된 레시피 가져 오는 메서드
  Future<List<Recipe>> selectCategoryRecipes(String category);
}
