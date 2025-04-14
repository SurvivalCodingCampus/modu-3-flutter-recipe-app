import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/data/repository/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl(this._recipeDataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    final dtoList = await _recipeDataSource.fetchRecipes();
    return dtoList.map((dto) => dto.toRecipe()).toList();
  }
}