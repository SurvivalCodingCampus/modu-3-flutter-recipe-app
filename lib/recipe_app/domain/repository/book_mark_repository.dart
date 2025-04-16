import 'package:recipe_app/recipe_app/data/model/recipe.dart';

abstract class BookMarkRepository {
  Future<List<Recipe>> bookMarkedRecipes();

  void toggleBookMark(int id);
}
