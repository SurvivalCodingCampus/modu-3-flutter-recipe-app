import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
