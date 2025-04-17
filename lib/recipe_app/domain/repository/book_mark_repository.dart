import 'package:recipe_app/recipe_app/data/model/recipe.dart';

abstract class BookMarkRepository {
  //북마크 된 레시피 가져 오는 메서드
  Future<List<Recipe>> getBookMarkedRecipes();

  Future<void> initializeBookmarks();

  Future<void> removeBookMark(int id);

  Future<void> addBookMark(Recipe recipe);
}
