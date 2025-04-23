import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';

import '../model/recipe.dart';
import 'recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> fetchRecipes() async {
    final recipeList = await _recipeDataSource.getRecipeData();
    return recipeList;
  }

  // title과 chef를 모두 소문자로 처리하고 그 안에 keyword를 포함하고 있는지 찾는 검색 메서드
  @override
  Future<List<Recipe>> searchRecipes(String keyword) async {
    final recipeList = await _recipeDataSource.getRecipeData();
    final searchRecipesList =
        recipeList
            .where(
              (e) =>
                  e.name.toLowerCase().contains(keyword.toLowerCase()) ||
                  e.chef.toLowerCase().contains(keyword.toLowerCase()),
            )
            .toList();
    return searchRecipesList;
  }

  @override
  Future<Recipe> fetchRecipeById(int id) async {
    final recipeList = await _recipeDataSource.getRecipeData();
    final recipeDto = recipeList.firstWhere(
      (e) => e.id == id,
      orElse: () {
        return throw Exception('레시피없음');
      },
    );
    return recipeDto;
  }
}
