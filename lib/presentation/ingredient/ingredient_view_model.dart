import 'package:flutter/cupertino.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_action.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';
import 'package:recipe_app/utils/errors/procedure_error_enum.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class IngredientViewModel extends ValueNotifier<IngredientState> {
  final RecipeRepository _repository;
  final ProcedureRepository _procedureRepository;

  IngredientViewModel(this._repository, this._procedureRepository)
    : super(const IngredientState());

  Future<void> findRecipeById(int id) async {
    value = value.copyWith(isLoading: true);
    final result = await _repository.findRecipeById(id);
    final procedureResult = await _procedureRepository.findProcedureByRecipeId(
      id,
    );

    switch (result) {
      case Success<Recipe, RecipeErrorEnum>():
        switch (procedureResult) {
          case Success<List<Procedure>, ProcedureErrorEnum>():
            value = value.copyWith(
              recipe: result.success,
              procedures: procedureResult.success,
              isLoading: false,
            );
          case Error<List<Procedure>, ProcedureErrorEnum>():
            value = value.copyWith(
              error: procedureResult.error,
              isLoading: false,
            );
        }

      case Error<Recipe, RecipeErrorEnum>():
        value = value.copyWith(error: result.error, isLoading: false);
    }
  }
}
