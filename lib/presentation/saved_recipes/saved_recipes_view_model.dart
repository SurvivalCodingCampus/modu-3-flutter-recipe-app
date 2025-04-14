import 'package:flutter/material.dart';

import '../../data/model/recipe.dart';
import '../../data/repository/recipe_ropository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SavedRecipesViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  void fetchRecipes() async {

    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }

}