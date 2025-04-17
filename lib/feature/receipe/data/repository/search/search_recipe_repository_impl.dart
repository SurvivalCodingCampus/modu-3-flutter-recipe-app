import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/exception/custom_exception.dart';
import 'package:recipe_app/feature/receipe/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/search/search_recipe_repository.dart';
import 'package:recipe_app/feature/receipe/data/data_source/search/search_recipe_data_source.dart';

class SearchRecipeRepositoryImpl implements SearchRecipeRepository {
  final SearchRecipeDataSource _dataSource;

  const SearchRecipeRepositoryImpl(this._dataSource);

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
