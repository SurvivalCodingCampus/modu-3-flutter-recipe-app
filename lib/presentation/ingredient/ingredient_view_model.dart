import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';

class IngredientViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  IngredientViewModel({required GetSavedRecipesUseCase getSavedRecipesUseCase})
    : _getSavedRecipesUseCase = getSavedRecipesUseCase;

  Recipe _recipe = Recipe();
  Recipe get recipe => _recipe;

  User _userModel = User();
  User get userModel => _userModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadRecipe(int recipeId) async {
    _isLoading = true;
    notifyListeners();
    _recipe = await _getSavedRecipesUseCase.getRecipeWithId(recipeId);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getUserModel(int userId) async {
    _isLoading = true;
    notifyListeners();
    _userModel = await _getSavedRecipesUseCase.getUserModel(userId);

    _isLoading = false;
    notifyListeners();
  }
}
