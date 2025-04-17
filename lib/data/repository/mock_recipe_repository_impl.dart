import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  MockRecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;
  @override
  Future<List<Recipe>> getRecipes() async {
    final List<Map<String, dynamic>> jsonList =
        await _recipeDataSource.getRecipeMaps();
    final recipeList = jsonList.map((e) => Recipe.fromJson(e)).toList();

    return recipeList;
  }
}
