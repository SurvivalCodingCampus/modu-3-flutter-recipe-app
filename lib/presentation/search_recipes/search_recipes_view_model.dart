import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../../data/model/recipe.dart';
import '../../data/repository/recipe_repository.dart';



class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();
  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._recipeRepository,this._state);

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final recipes= await _recipeRepository.getRecipe();
    _state = _state.copyWith(recipes: recipes, filterRecipes: recipes, isLoading: false);
    notifyListeners();
  }
}
