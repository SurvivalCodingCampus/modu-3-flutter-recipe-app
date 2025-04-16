import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/exception/custom_exception.dart';
import 'package:recipe_app/feature/receipe/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/home/recipe_repository.dart';
import 'package:recipe_app/feature/receipe/data/data_source/home/recipe_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  const RecipeRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final resp = await _dataSource.getRecipes();
      final recipes = resp.map((e) => e.toRecipe()).toList();
      return Result.success(recipes);
    } catch (e) {
      return const Result.error(NetworkException());
    }
  }

  @override
  Future<Result<bool>> bookmarkRecipe(int id) async {
    final resp =
        (await _dataSource.getRecipes())
            .where((e) => e.id == id)
            .first
            .bookmarkStatus;
    return Future.value(Result.success(!resp!));
  }
}
