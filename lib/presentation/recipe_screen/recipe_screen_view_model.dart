import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/get_procedure_by_use_case.dart';
import 'package:recipe_app/presentation/recipe_screen/recipe_screen_state.dart';

import '../../data/model/recipe_model.dart';
import '../../domain/use_case/get_ingredient_by_use_case.dart';

class RecipeScreenViewModel with ChangeNotifier {
  final Recipe recipe;

  final GetIngredientByUseCase _getIngredients;
  final GetProceduresByRecipeUseCase _getProcedures;

  RecipeScreenState _state = const RecipeScreenState();

  RecipeScreenState get state => _state;

  RecipeScreenViewModel(
    this.recipe,
    this._getIngredients,
    this._getProcedures,
  ) {
    _state = _state.copyWith(recipe: recipe);
    loadData();
  }

  Future<void> loadData() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final ingredients = await _getIngredients.execute(recipe.id.toString());
      final procedures = await _getProcedures.execute(recipe.id.toString());

      _state = _state.copyWith(
        ingredients: ingredients,
        procedures: procedures,
        isLoading: false,
      );
    } catch (e) {
      _state = _state.copyWith(error: e.toString(), isLoading: false);
    }

    notifyListeners();
  }

  void selectIngredientTab() {
    _state = _state.copyWith(isIngredientSelected: true);
    notifyListeners();
  }

  void selectProcedureTab() {
    _state = _state.copyWith(isIngredientSelected: false);
    notifyListeners();
  }
}
