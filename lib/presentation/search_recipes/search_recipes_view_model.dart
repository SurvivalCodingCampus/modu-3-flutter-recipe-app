import 'package:flutter/material.dart';
import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesViewModel(this._searchRecipesUseCase);

  SearchRecipesState get state => _state;

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case OnSubmitSearch():
        _searchRecipes(action.query);
      case OnApplyFilter():
        _setSearchFilter(action.state);
      case OnTapBackArrow():
    }
  }

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      recipes: _searchRecipesUseCase.recentRecipes,
      isLoading: false,
    );

    notifyListeners();
  }

  Future<void> _setSearchFilter(FilterSearchBottomSheetState state) async {
    _state = _state.copyWith(bottomSheetFilter: state);
    notifyListeners();
  }

  Future<void> _searchRecipes(String query) async {
    _state = _state.copyWith(query: query, isLoading: true);
    notifyListeners();

    final Result<List<Recipe>, RecipeError> result = await _searchRecipesUseCase
        .execute(
          query,
          FilterSearchBottomSheetState.rates[state.bottomSheetFilter.rateIndex],
        );

    switch (result) {
      case Success(:final List<Recipe> data):
        final recipes =
            data
                .where(
                  (recipe) =>
                      recipe.rating ==
                      FilterSearchBottomSheetState.rates[state
                          .bottomSheetFilter
                          .rateIndex],
                )
                .toList();

        _state = _state.copyWith(recipes: recipes, isLoading: false);
        break;
      case Failure(:final RecipeError error):
        _state = _state.copyWith(error: error, isLoading: false);
        break;
    }

    notifyListeners();
  }
}
