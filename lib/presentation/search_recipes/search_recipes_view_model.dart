import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository);

  SearchRecipesState _state = const SearchRecipesState();
  SearchRecipesState get state => _state;

  Future<void> fetchSearchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final recipes = await _recipeRepository.searchRecipes(state.keyword);
      _state = _state.copyWith(recipes: recipes, isLoading: false);
    } catch (e) {
      _state = _state.copyWith(isLoading: false);

      print('Error fetching recipes: $e');
    }
    notifyListeners();
  }

  Future<void> updateKeyword(String keyword) async {
    _state = _state.copyWith(keyword: keyword);
    notifyListeners();
  }
}
