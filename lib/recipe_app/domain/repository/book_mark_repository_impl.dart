import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';

import 'book_mark_repository.dart';

class BookMarkRepositoryImpl implements BookMarkRepository {
  final RecipeDataSource _recipeDataSource;

  BookMarkRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  //빈 북마크된 레시피들을 모아두는 리스트 생성
  List<Recipe> bookMarks = [];
  bool _initialized = false;

  bool get initialized => _initialized;

  @override
  Future<void> initializeBookmarks() async {
    final allRecipes = await _recipeDataSource.getRecipeData(); // await 필수!
    bookMarks = allRecipes.where((recipe) => recipe.bookMarked).toList();
    _initialized = true;
  }

  @override
  Future<void> addBookMark(Recipe recipe) async {
    if (initialized == false) {
      await initializeBookmarks();
    }
    bookMarks.add(recipe);
  }

  @override
  Future<void> removeBookMark(int id) async {
    bookMarks.removeWhere((recipe) => recipe.id == id);
  }

  @override
  Future<List<Recipe>> getBookMarkedRecipes() async {
    return bookMarks;
  }
}
