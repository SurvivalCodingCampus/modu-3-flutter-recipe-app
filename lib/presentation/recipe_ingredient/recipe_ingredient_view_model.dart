import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_state.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final ProcedureRepository _procedureRepository;

  RecipeIngredientViewModel({
    required RecipeRepository recipeRepository,
    required ProcedureRepository procedureRepository,
  }) : _recipeRepository = recipeRepository,
       _procedureRepository = procedureRepository;

  RecipeIngredientState _state = const RecipeIngredientState();

  RecipeIngredientState get state => _state;

  Future<void> loadRecipeIngredient(String recipeId) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _recipeRepository.getRecipes();
    final recipe = recipes.firstWhere((e) => e.id == recipeId);
    final procedures = await _procedureRepository.getProcedures(
      int.parse(recipeId),
    );
    _state = state.copyWith(
      recipe: recipe,
      procedures: procedures,
      isLoading: false,
    );
    notifyListeners();
  }
}
