import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/repository/recipe/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipesDto = await _recipeDataSource.getRecipes();

    return recipesDto.map((recipe) => recipe as Recipe).toList();
  }
}
