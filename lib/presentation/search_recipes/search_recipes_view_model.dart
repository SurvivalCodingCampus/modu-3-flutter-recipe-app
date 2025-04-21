import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../../domain/use_case/fetch_search_recipe_use_case.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final FetchSearchRecipeUseCase _useCase;

  SearchRecipesViewModel(this._useCase);

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  final _stateController = StreamController<SearchRecipesState>.broadcast();

  Stream<SearchRecipesState> get stateStream => _stateController.stream;

  String? _categoryFilter;
  int? _rateFilter;
  String? _timeFilter;

  void resetFilters() {
    _categoryFilter = null;
    _rateFilter = 1;
    _timeFilter = null;
  }

  Future<void> restoreLastSearch() async {
    final cached = _useCase.lastCachedResults;

    if (cached == null) {
      await fetchInitialRecipes();
      return;
    }

    _state = _state.copyWith(
      recipes: cached,
      filteredRecipes: cached,
      isFiltered: false,
      isLoading: false,
    );
    _stateController.add(_state);
    notifyListeners();
  }

  Future<void> fetchInitialRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final results = await _useCase.execute('');
    _state = _state.copyWith(
      isLoading: false,
      recipes: results,
      filteredRecipes: results,
      isFiltered: false,
    );
    _stateController.add(_state);
    notifyListeners();
  }

  Future<void> updateKeyword(String keyword) async {
    _state = _state.copyWith(keyword: keyword, isLoading: true);
    notifyListeners();

    final results = await _useCase.execute(keyword);
    _state = _state.copyWith(
      isLoading: false,
      recipes: results,
      filteredRecipes: results,
    );
    _stateController.add(_state);
    notifyListeners();
  }

  Future<void> updateFilters({
    String? category,
    required int? rate,
    String? time,
  }) async {
    _categoryFilter = category == 'All' ? null : category;
    _rateFilter = rate;
    _timeFilter = time == 'All' ? null : time;

    await fetchFilteredRecipes();
  }

  Future<void> fetchFilteredRecipes() async {
    final recipes = _useCase.lastCachedResults ?? [];

    final filtered =
        recipes.where((recipe) {
          final matchesCategory =
              _categoryFilter == null || recipe.category == _categoryFilter;
          final matchesTime =
              _timeFilter == null || recipe.time.contains(_timeFilter!);
          final matchesRate =
              _rateFilter == null || recipe.rating >= _rateFilter!;

          return matchesCategory && matchesTime && matchesRate;
        }).toList();

    _state = _state.copyWith(filteredRecipes: filtered, isFiltered: true);
    _stateController.add(_state);
    notifyListeners();
  }

  void dispose() {
    _stateController.close();
  }
}
