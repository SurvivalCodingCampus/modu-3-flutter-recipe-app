import 'package:flutter/material.dart';

import '../../domain/model/recipe.dart';
import '../../domain/repository/recipe_repository.dart';



class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  SavedRecipesViewModel(this._recipeRepository);


  Future<void> fetchRecipes() async {
    _recipes = await _recipeRepository.getRecipe();
    notifyListeners();
  }
}
