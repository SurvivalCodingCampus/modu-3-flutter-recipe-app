import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/repository/recipes/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  SearchRecipesState _state = SearchRecipesState();

  void getRecipes() async {
    _state = _state.copyWith(isSearchLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recipeRepository.getAllRecipeList(),
      isSearchLoading:  false
    );
    notifyListeners();
  }
}
