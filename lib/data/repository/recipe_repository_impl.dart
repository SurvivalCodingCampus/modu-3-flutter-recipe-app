import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/domain/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource<RecipeDto> _dataSource;

  const RecipeRepositoryImpl(RecipeDataSource<RecipeDto> dataSource)
    : _dataSource = dataSource;

  @override
  Future<Result<List<Recipe>, RecipeErrorEnum>> findDatas() async {
    try {
      final List<RecipeDto> dtos = await _dataSource.findDatas();

      return Result.success(dtos.map((e) => e.toRecipe()).toList());
    } on RecipeErrorEnum {
      return const Result.error(RecipeErrorEnum.networkerror);
    }
  }

  @override
  Future<Result<Recipe, RecipeErrorEnum>> findRecipeById(int id) async {
    try {
      final RecipeDto dto = await _dataSource.findData(id);

      return Result.success(dto.toRecipe());
    } on RecipeErrorEnum {
      return const Result.error(RecipeErrorEnum.networkerror);
    }
  }
}
