import 'package:collection/collection.dart';
import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;
  final List<Recipe> _recentSearchRecipes = [];

  RecipeRepositoryImpl(this._dataSource);

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

  @override
  Future<void> addRecentSearchRecipe(List<Recipe> recipes) async {
    final recentSet = _recentSearchRecipes.toSet();
    final newRecipes = recipes.where((recipe) => !recentSet.contains(recipe));
    _recentSearchRecipes.addAll(newRecipes);
  }

  @override
  Future<Result<List<Recipe>, RecipeError>> getRecentSearchRecipes() async {
    return Success(_recentSearchRecipes);
  }
}
