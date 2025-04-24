import 'package:flutter/material.dart';
import 'package:recipe_app/domain/use_case/get_recipe_by_id_use_case.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/get_user_model_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';

class IngredientViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;
  final GetRecipeByIdUseCase _getRecipeByIdUseCase;
  final GetUserModelUseCase _getUserModelUseCase;

  IngredientViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
    required GetRecipeByIdUseCase getRecipeByIdUseCase,
    required GetUserModelUseCase getUserModelUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase,
       _getRecipeByIdUseCase = getRecipeByIdUseCase,
       _getUserModelUseCase = getUserModelUseCase;

  IngredientState _state = const IngredientState();
  IngredientState get state => _state;

  Future<void> loadRecipe(int recipeId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipe = await _getRecipeByIdUseCase.execute(recipeId);
    _state = _state.copyWith(isLoading: false, recipe: recipe);
    notifyListeners();
  }

  Future<void> getUserModel(int userId) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final userModel = await _getUserModelUseCase.execute(userId);
    _state = _state.copyWith(isLoading: false, userModel: userModel);
    notifyListeners();
  }
}
