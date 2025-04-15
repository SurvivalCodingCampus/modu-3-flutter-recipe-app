import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../../data/repository/recipe_repository/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository);

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  String? _categoryFilter;
  int? _rateFilter;
  String? _TimeFilter;

  Future<void> updateFilters({
    String? category,
    required int? rate,
    String? time,
  }) async {
    _categoryFilter = category;
    _rateFilter = rate;
    _TimeFilter = time;
    await fetchFilteredRecipes();
  }

  Future<void> fetchFilteredRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final recipes = await _recipeRepository.searchRecipes(state.keyword);
      final keyword = state.keyword.toLowerCase();

      final filtered =
          recipes.where((recipe) {
            final matchesCategory =
                _categoryFilter == null || recipe.category == _categoryFilter;
            final matchesTime =
                _TimeFilter == null || recipe.time == _TimeFilter;
            final matchesRate =
                _rateFilter == null || recipe.rating >= _rateFilter!;

            return matchesCategory && matchesTime && matchesRate;
          }).toList();
      _state = _state.copyWith(
        isLoading: false,
        recipes: recipes,
        filteredRecipes: filtered,
        isFiltered:
            keyword.isNotEmpty ||
            _categoryFilter != null ||
            _TimeFilter != null ||
            _rateFilter != null,
      );
    } catch (e) {
      _state = _state.copyWith(isLoading: false);
      print('Error fetching recipes: $e');
    }
    notifyListeners();
  }

  Future<void> fetchSearchRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final recipes = await _recipeRepository.searchRecipes(state.keyword);

      final keyword = state.keyword.toLowerCase();
      final filtered =
          keyword.isEmpty
              ? recipes
              : recipes
                  .where(
                    (recipe) => recipe.name.toLowerCase().contains(keyword),
                  )
                  .toList();

      _state = _state.copyWith(
        isLoading: false,
        recipes: recipes,
        filteredRecipes: filtered,
        isFiltered: keyword.isNotEmpty,
      );
    } catch (e) {
      _state = _state.copyWith(isLoading: false);
      print('Error fetching recipes: $e');
    }

    notifyListeners();
  }

  Future<void> fetchRecipes() async {
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
    fetchSearchRecipes();
  }
}
