import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

import '../../domain/model/recipe.dart';
import 'filter_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  SearchRecipesViewModel(RecipeRepository repository)
    : _repository = repository;

  Future<void> action(SearchRecipesAction action) async {
    switch (action) {
      case Search():
        _search(action.value);
      case SearchFilter():
        _searchFilter(action.state);
      case FindRecipes():
        _findRecipes();
    }
  }

  Future<void> _findRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.findDatas();

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(
          recipes: result.success,
          isLoading: false,
          filtetState: const FilterState(
            category: 'All',
            rate: '5',
            time: 'All',
          ),
          count: result.success.length,
        );
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(error: result.error, isLoading: false);
        notifyListeners();
    }
  }

  Future<void> _search(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    query = query.toLowerCase();

    final result = await _repository.findRecipeByQuery(query);

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(
          recipes: result.success,
          isLoading: false,
          count: result.success.length,
        );
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(error: result.error, isLoading: false);
        notifyListeners();
    }
  }

  Future<void> _searchFilter(FilterState filterState) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.findDatas();

    switch (result) {
      case Success<List<Recipe>, RecipeErrorEnum>():
        List<Recipe> recipes = [];

        recipes =
            result.success.where((e) {
              return e.rate.floor() == int.parse(filterState.rate);
            }).toList();

        if (filterState.category != 'All') {
          recipes =
              recipes.where((e) {
                return e.category.name == filterState.category.toLowerCase();
              }).toList();
        }

        if (filterState.time != 'All') {
          // recipe 데이터 안에 createdAt 등의 정보가 없기 때문에 정렬 불가.
        }

        _state = state.copyWith(
          recipes: recipes,
          filtetState: filterState,
          isLoading: false,
          count: recipes.length,
        );
        notifyListeners();
      case Error<List<Recipe>, RecipeErrorEnum>():
        _state = state.copyWith(error: result.error, isLoading: false);
        notifyListeners();
    }
  }
}
