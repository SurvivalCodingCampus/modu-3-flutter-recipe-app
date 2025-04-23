import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/recipe_screen/recipe_screen_state.dart';

import '../../data/model/recipe_model.dart';

class RecipeScreenViewModel with ChangeNotifier {
  final Recipe recipe;

  RecipeScreenState _state = const RecipeScreenState();

  RecipeScreenState get state => _state;

  RecipeScreenViewModel(this.recipe) {
    _state = _state.copyWith(recipe: recipe);
    loadData();
  }

  Future<void> loadData() async {
    _state = _state.copyWith(ingredients: recipe.ingredients, isLoading: false);
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
