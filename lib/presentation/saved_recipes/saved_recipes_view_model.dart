import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  List<Recipe> _recipes = List.unmodifiable([]);
  bool _isLoading = false;
  RecipeErrorEnum? _error;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;
  RecipeErrorEnum? get error => _error;

  SavedRecipesViewModel(RecipeRepository repository) : _repository = repository;

  Future<void> findRecipes() async {
    _isLoading = true;
    notifyListeners();

    final result = await _repository.findDatas();

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _recipes = result.success;
        _isLoading = false;
        _error = null;
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        _isLoading = false;
        _error = result.error;
        notifyListeners();
    }
  }
}
