import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  // 상태
  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  HomeViewModel(this._recipeRepository);

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _recipeRepository.getRecipes();
    _isLoading = false;
    notifyListeners();
  }
}
