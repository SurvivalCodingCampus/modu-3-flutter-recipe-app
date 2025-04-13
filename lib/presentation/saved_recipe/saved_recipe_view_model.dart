import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';

import '../../data/model/recipe_model.dart';

class SavedRecipeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipeViewModel(this._recipeRepository);

  List<Recipe> _savedRecipes = [];

  List<Recipe> get savedRecipes => List.unmodifiable(_savedRecipes);
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchSavedRecipes() async {
    try {
      _isLoading = true;
      notifyListeners();
      _savedRecipes = await _recipeRepository.getRecipes();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
