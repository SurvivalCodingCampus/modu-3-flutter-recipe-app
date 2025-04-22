import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/steps/steps_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/dto/step_dto.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/data/mapper/step_mapper.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';
import 'package:recipe_app/presentation/component/button/enum/star.dart';
import 'package:recipe_app/presentation/component/button/enum/time.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;
  final StepsDataSource _stepsDataSource;
  final List<int> recipeIds = [];

  RecipeRepositoryImpl(this._recipeDataSource, this._stepsDataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    final List<RecipeDto> recipesDto = await _recipeDataSource.getRecipes();
    final List<StepDto> steps = await _stepsDataSource.getAllSteps();

    return recipesDto.map((dto) {
      final recipesSteps =
          steps.where((element) => element.recipeId == dto.id).toList();
      return dto.toRecipe().copyWith(
        step: recipesSteps.map((e) => e.toStep()).toList(),
      );
    }).toList();
  }

  @override
  Future<Recipe> getRecipe(int recipeId) async {
    final recipeDto = await _recipeDataSource.getRecipe(recipeId);
    final stepDto = await _stepsDataSource.getStepsbyId(recipeId);

    return recipeDto.toRecipe().copyWith(
      step: stepDto.map((e) => e.toStep()).toList(),
    );
  }

  @override
  Future<List<Recipe>> getSearchRecipes(String inputText) async {
    final recipes = await _recipeDataSource.getRecipes();
    final searchRecipes =
        recipes
            .where(
              (element) => element.title!.toLowerCase().contains(
                inputText.toLowerCase(),
              ),
            )
            .toList();

    return searchRecipes.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<List<Recipe>> getFilterRecipes(
    CategoryType category,
    Star star,
    Time time,
    String inputText,
  ) async {
    final List<RecipeDto> allRecipes = await _recipeDataSource.getRecipes();

    final categoryFilter =
        category == CategoryType.all
            ? allRecipes
            : allRecipes
                .where(
                  (recipe) =>
                      recipe.category!.toLowerCase() ==
                      category.name.toLowerCase(),
                )
                .toList();
    final starFilter =
        categoryFilter
            .where(
              (recipe) =>
                  recipe.rating! >= star.minRating &&
                  recipe.rating! < star.maxRating,
            )
            .toList();

    List<RecipeDto> sorted = [...starFilter];
    switch (time) {
      case Time.all:
        break;
      case Time.newest:
        sorted.sort((a, b) => b.id!.compareTo(a.id!));
        break;
      case Time.oldest:
        sorted.sort((a, b) => a.id!.compareTo(b.id!));
        break;
      case Time.popularity:
        sorted.sort((a, b) => b.rating!.compareTo(a.rating!));
        break;
    }
    final search =
        sorted
            .where(
              (element) => element.title!.toLowerCase().contains(
                inputText.toLowerCase(),
              ),
            )
            .toList();

    return search.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<List<Recipe>> getRecentRecipes() async {
    final allRecipes = await _recipeDataSource.getRecipes();

    final recentRecipes =
        allRecipes.where((recipe) => recipeIds.contains(recipe.id)).toList();

    return recentRecipes.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<void> saveRecentRecipes(List<int> ids) async {
    recipeIds.clear();
    recipeIds.insertAll(0, ids);

    if (recipeIds.length > 8) {
      recipeIds.removeLast();
    }
  }
}
