import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  List<Recipe> _savedRecipes = [];

  List<Recipe> get savedRecipes => List.unmodifiable(_savedRecipes);
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchSavedRecipes() async {
    _isLoading = true;
    notifyListeners();

    _savedRecipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
