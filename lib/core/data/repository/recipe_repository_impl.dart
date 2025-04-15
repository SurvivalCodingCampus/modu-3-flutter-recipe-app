// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:recipe_app/core/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/core/data/dto/recipe_dto.dart';
import 'package:recipe_app/core/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/core/data/model/recipe.dart';
import 'package:recipe_app/core/data/repository/recipe_repository.dart';
import 'package:recipe_app/core/failure.dart';
import 'package:recipe_app/core/result.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource? remoteDataSource;
  final RecipeDataSource localDataSource;

  RecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    // 원격 데이터 소스가 있는 경우 먼저 시도
    if (remoteDataSource != null) {
      try {
        final List<RecipeDto> recipeDtos =
            await remoteDataSource!.fetchRecipes();
        final List<Recipe> models =
            recipeDtos.map((e) => e.toRecipe()).toList();
        return Result.success(models);
      } catch (e, _) {
        debugPrint('⚠️ remoteDataSource 실패 → local fallback');
      }
    }
    // 원격 데이터 소스가 없거나 실패한 경우 로컬 데이터 소스 사용
    try {
      final List<RecipeDto> recipeDtos = await localDataSource.fetchRecipes();
      final List<Recipe> models = recipeDtos.map((e) => e.toRecipe()).toList();
      return Result.success(models);
    } catch (e2) {
      debugPrint('⚠️ localDataSource 실패 → error fallback $e2)');
      return Result.error(Failure('레시피 데이터를 불러오는 데 실패했습니다.', cause: e2));
    }
  }
}
