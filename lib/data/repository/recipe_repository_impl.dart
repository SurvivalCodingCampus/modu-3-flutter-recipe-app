import 'package:collection/collection.dart';
import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  const RecipeRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Recipe>, RecipeError>> findAll() async {
    final List<Recipe> result = await _dataSource.fetch();

    if (result.isEmpty) {
      return const Failure(RecipeError.notFound);
    }

    return Success(result);
  }

  @override
  Future<Result<Recipe, RecipeError>> findById(int id) async {
    final recipes = await findAll();

    switch (recipes) {
      case Success(:final data):
        final recipe = data.firstWhereOrNull((recipe) => recipe.id == id);
        if (recipe == null) {
          return const Failure(RecipeError.notFound);
        }
        return Success(recipe);
      case Failure(:final error):
        return Failure(error);
    }
  }

  @override
  Future<Result<List<Recipe>, RecipeError>> findAllByFilter(
    bool Function(Recipe) predicate,
  ) async {
    final List<Recipe> result = await _dataSource.fetch();

    if (result.isEmpty) {
      return const Failure(RecipeError.notFound);
    }

    return Success(result.where(predicate).toList());
  }
}
