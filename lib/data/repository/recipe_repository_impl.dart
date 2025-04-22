import 'package:recipe_app/data/data_source/file_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/mapper/recipe_info_mapper.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/domain/mapper/recipe_dto_mapper.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/recipe_info.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';
import 'package:recipe_app/domain/model/type/rate_type.dart';
import 'package:recipe_app/domain/model/type/time_filter_type.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;
  final FileDataSource _fileDataSource;

  RecipeRepositoryImpl({required RecipeDataSource recipeDataSource, required FileDataSource fileDataSource})
      : _recipeDataSource = recipeDataSource,
        _fileDataSource = fileDataSource;

  @override
  Future<List<Recipe>> getSavedRecipes({
    String query = '',
    TimeFilterType? timeFilterType,
    RateType? rateType,
    CategoryFilterType? categoryFilterType,
  }) async {
    final savedRecipesDto = await _recipeDataSource.fetchSavedRecipes(
      query: query,
      timeFilterType: timeFilterType,
      rateType: rateType,
      categoryFilterType: categoryFilterType,
    );
    return savedRecipesDto.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<RecipeInfo> getRecipesInfo({required String id}) async {
    final savedRecipesDto = await _recipeDataSource.fetchRecipeInfo(id: id);
    return savedRecipesDto.toRecipeInfo();
  }

  @override
  Future<List<Recipe>> getSavedRecentRecipes() async {
    final recipesDto = await _fileDataSource.getSavedRecentRecipes();
    return recipesDto.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<void> saveRecentRecipes(List<Recipe> recipes) async {
    final recipesDto = recipes.map((e) => e.toRecipeDto()).toList();
    _fileDataSource.saveRecentRecipes(recipesDto);
  }
}
