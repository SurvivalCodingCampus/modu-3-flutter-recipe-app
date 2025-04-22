import 'package:recipe_app/data/remote_data_source/remote_data_source.dart';
import 'package:recipe_app/data/mapper/mapper.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final response = await _recipeDataSource.getRecipes();
    return response.map((e) => e.toRecipe()).toList();
  }
}
