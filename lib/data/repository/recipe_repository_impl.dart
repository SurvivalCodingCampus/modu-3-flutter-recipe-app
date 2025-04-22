import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/domain/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource<RecipeDto> _dataSource;
  List<Recipe> _cacheSearch = [];

  RecipeRepositoryImpl(RecipeDataSource<RecipeDto> dataSource)
    : _dataSource = dataSource;

  Future<List<Recipe>> _getRecipe() async {
    final List<RecipeDto> dtos = await _dataSource.findDatas();
    final List<Recipe> recipes = dtos.map((e) => e.toRecipe()).toList();

    return recipes;
  }

  @override
  Future<Result<List<Recipe>, RecipeErrorEnum>> findDatas() async {
    try {
      return Result.success(await _getRecipe());
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

  @override
  Future<Result<List<Recipe>, RecipeErrorEnum>> findRecipeByQuery(
    String query,
  ) async {
    try {
      List<Recipe> recipes = await _getRecipe();

      if (query == '' && _cacheSearch.isEmpty) {
        return Result.success(recipes);
      } else if (query == '' && _cacheSearch.isNotEmpty) {
        return Result.success(_cacheSearch);
      }

      recipes =
          recipes
              .where((e) => e.foodName.toLowerCase().contains(query))
              .toList();

      _cacheSearch = recipes;

      return Result.success(_cacheSearch);
    } on RecipeErrorEnum {
      return const Result.error(RecipeErrorEnum.networkerror);
    }
  }
}
