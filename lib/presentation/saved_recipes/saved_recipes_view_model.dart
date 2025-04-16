import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SavedRecipesViewModel({
    required GetSavedRecipesUseCase getSavedRecipesUseCase,
  }) : _getSavedRecipesUseCase = getSavedRecipesUseCase {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _getSavedRecipesUseCase.getSavedRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
