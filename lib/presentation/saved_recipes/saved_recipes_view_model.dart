import 'package:flutter/material.dart';
import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/remove_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final RemoveSavedRecipesUseCase _removeSavedRecipesUseCase;

  SavedRecipesState _state = const SavedRecipesState();

  SavedRecipesViewModel(
    this._getSavedRecipesUseCase,
    this._removeSavedRecipesUseCase,
  );

  SavedRecipesState get state => _state;

  Future<void> getSavedRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Recipe>, RecipeError> result =
        await _getSavedRecipesUseCase.execute();

    print(result);

    switch (result) {
      case Success(:final data):
        _state = _state.copyWith(recipes: data, isLoading: false);
        notifyListeners();
        break;
      case Failure(error: final error):
        _state = _state.copyWith(error: error, isLoading: false);
        notifyListeners();
        break;
    }
  }

  Future<void> removeSavedRecipe(int id) async {
    await _removeSavedRecipesUseCase.execute(id);

    final Result<List<Recipe>, RecipeError> result =
        await _getSavedRecipesUseCase.execute();

    switch (result) {
      case Success(:final data):
        _state = _state.copyWith(recipes: data, isLoading: false);
        break;
      case Failure(error: final error):
        _state = _state.copyWith(error: error, isLoading: false);
        break;
    }

    notifyListeners();
  }
}
