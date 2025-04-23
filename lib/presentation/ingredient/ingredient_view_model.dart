import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  IngredientViewModel({required GetSavedRecipesUseCase getSavedRecipesUseCase})
    : _getSavedRecipesUseCase = getSavedRecipesUseCase;

  IngredientState _state = const IngredientState();
  IngredientState get state => _state;

  Future<void> loadRecipe(int recipeId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipe = await _getSavedRecipesUseCase.getRecipeWithId(recipeId);
    _state = _state.copyWith(isLoading: false, recipe: recipe);
    notifyListeners();
  }

  Future<void> getUserModel(int userId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final userModel = await _getSavedRecipesUseCase.getUserModel(userId);
    _state = _state.copyWith(isLoading: false, userModel: userModel);
    notifyListeners();
  }
}
