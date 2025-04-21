import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/mepper/recipe_mepper.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;
  RecipeRepositoryImpl({required RecipeDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipeDto = await _dataSource.getRecipeDtos();
    return recipeDto.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<Recipe> getRecipe(int recipeId) {
    return _dataSource.getRecipeDto(recipeId).then((value) => value.toRecipe());
  }
}
