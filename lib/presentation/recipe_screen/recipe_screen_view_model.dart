import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/get_procedure_by_use_case.dart';
import 'package:recipe_app/presentation/recipe_screen/recipe_screen_state.dart';

import '../../domain/use_case/get_ingredient_by_use_case.dart';
import '../../domain/use_case/get_recipe_by_use_case.dart';

class RecipeScreenViewModel with ChangeNotifier {
  final String recipeId;
  final GetRecipeByUseCase _getRecipe;
  final GetIngredientByUseCase _getIngredients;
  final GetProceduresByRecipeUseCase _getProcedures;

  RecipeScreenState _state = const RecipeScreenState();

  RecipeScreenState get state => _state;

  RecipeScreenViewModel(
    this.recipeId,
    this._getRecipe,
    this._getIngredients,
    this._getProcedures,
  ) {
    loadData();
  }

  Future<void> loadData() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final recipe = await _getRecipe.execute(recipeId);
      final ingredients = await _getIngredients.execute(recipeId);
      final procedures = await _getProcedures.execute(recipeId);

      _state = _state.copyWith(
        recipe: recipe,
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
