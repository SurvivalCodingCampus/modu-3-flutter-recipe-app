import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/steps/steps_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/dto/step_dto.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/data/mapper/step_mapper.dart';
import 'package:recipe_app/domain/model/recipe.dart';

import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;
  final StepsDataSource _stepsDataSource;

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
}
