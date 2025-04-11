import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  MockRecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(Duration(seconds: 1));
    final List<Map<String, dynamic>> jsonList =
        await _recipeDataSource.getRecipeMaps();
    final recipeList = jsonList.map((e) => Recipe.fromJson(e)).toList();

    return recipeList;
  }
}
