import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../../domain/repository/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesState _state = SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel(this._recipeRepository, this._state);

  Future<void> fetchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: await _recipeRepository.getRecipe(),
      isLoading: false,
    );
    notifyListeners();
  }

  Future<void> fetchSearchRecipes(String inputText) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    if (inputText.isEmpty) {
      final allRecipes = await _recipeRepository.getRecipe();
      _state = _state.copyWith(recipes: allRecipes, isLoading: false);
    } else {
      final filterTitle =
          _state.recipes
              .where(
                (e) => e.title.toLowerCase().contains(inputText.toLowerCase()),
              ).toList();
      _state = state.copyWith(recipes: filterTitle, isLoading: false);
    }

    notifyListeners();
  }

  Future<void> updateKeyword(String keyword) async {
    _state = state.copyWith(searchKeyword: keyword);
    await fetchSearchRecipes(keyword);
  }
}
