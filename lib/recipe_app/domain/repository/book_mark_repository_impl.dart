import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_saved_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';

import 'book_mark_repository.dart';

class BookMarkRepositoryImpl implements BookMarkRepository {
  final RecipeDataSource _recipeDataSource;
  MockSavedRecipeDataImpl mockSavedRecipeDataImpl = MockSavedRecipeDataImpl();

  BookMarkRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> bookMarkedRecipes() async {
    //step1. 모든 레시피 데이터 불러옴
    final recipeList = await _recipeDataSource.getRecipeData();
    //step2. book Marked 가 True인 레시피를 리스트 형식으로 반환
    final bookMarkedRecipesList =
        recipeList.where((e) => e.bookMarked == true).toList();
    return bookMarkedRecipesList;
  }

  @override
  void toggleBookMark(int id) {
    // TODO: implement toggleBookMark
  }
}
