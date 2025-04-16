import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/exception/custom_exception.dart';
import 'package:recipe_app/feature/receipe/data/data_source/info/recipe_info_data_source.dart';
import 'package:recipe_app/feature/receipe/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/info/recipe_info_repository.dart';

class RecipeInfoRepositoryImpl implements RecipeInfoRepository {
  final RecipeInfoDataSource _dataSource;

  RecipeInfoRepositoryImpl(this._dataSource);

  @override
  Future<Result<Recipe>> getRecipeInfo(int id) async {
    try {
      final recipeDto = await _dataSource.getRecipeInfo(id);
      return Result.success(recipeDto.toRecipe());
    } catch (e) {
      return const Result.error(NetworkException());
    }
  }
}
