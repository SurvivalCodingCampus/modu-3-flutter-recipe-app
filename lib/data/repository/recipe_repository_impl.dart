import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/mepper/recipe_mepper.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/screen/search_recipes/state/filter_search_state.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;
  RecipeRepositoryImpl({required RecipeDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final recipeDto = await _dataSource.getRecipeDto();
    return recipeDto.map((e) => e.toRecipe()).toList();
  }
}
