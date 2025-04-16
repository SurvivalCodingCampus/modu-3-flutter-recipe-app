import 'package:flutter/material.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class RecipeIngredientViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  final int _recipeId;

  int get recipeId => _recipeId;

  RecipeIngredientViewModel({
    required RecipeRepository recipeRepository,
    required int recipeId
  })
      : _recipeRepository = recipeRepository,
        _recipeId = recipeId;

  void fetchData() async{
    await _recipeRepository.getRecipe(_recipeId);
    notifyListeners();
  }
}