import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  List<Recipe> _recipes = [];
  bool _isLoading = false;

  SavedRecipesViewModel(this._repository);

  List<Recipe> get recipes => List.unmodifiable(_recipes);
  bool get isLoading => _isLoading;

  Future<void> fetchAll() async {
    _isLoading = true;
    notifyListeners();

    _recipes = await _repository.findAll();

    _isLoading = false;
    notifyListeners();
  }
}
