import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/exception/custom_exception.dart';
import 'package:recipe_app/feature/receipe/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/repository/recipe_repository.dart';
import 'package:recipe_app/feature/receipe/domain/data_source/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  RecipeRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final resp = await _dataSource.getRecipes();
      final recipes = resp.map((e) => e.toRecipe()).toList();
      return Success(recipes);
    } catch (e) {
      return const Error(NetworkException());
    }
  }
}
