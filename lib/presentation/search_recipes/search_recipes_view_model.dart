import 'package:flutter/material.dart';
import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/core/result_extension.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_recent_search_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final SearchRecipesUseCase _searchRecipesUseCase;
  final GetRecentSearchRecipesUseCase _getRecentSearchRecipesUseCase;

  SearchRecipesState _state = const SearchRecipesState(
    bottomSheetFilter: FilterSearchBottomSheetState(
      categoryIndicies: [0],
      rateIndex: 1,
      timeIndex: 0,
    ),
  );

  SearchRecipesViewModel(
    this._searchRecipesUseCase,
    this._getRecentSearchRecipesUseCase,
  );

  SearchRecipesState get state => _state;

  void onAction(SearchRecipesAction action) {
    switch (action) {
      case OnSubmitSearch():
        _searchRecipes(action.query);
      case OnApplyFilter():
        _setSearchFilter(action.state);
      case OnTapBackArrow():
        break;
    }
  }

  Future<void> fetchRecentRecipes() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Recipe>, RecipeError> result =
        await _getRecentSearchRecipesUseCase.execute();

    result.handle(
      onSuccess: (data) {
        _state = _state.copyWith(recipes: data, isLoading: false);
      },
      onError: (error) {
        _state = _state.copyWith(error: error, isLoading: false);
      },
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

    final Result<List<Recipe>, RecipeError> searchResult =
        await _searchRecipesUseCase.execute(query, _state.bottomSheetFilter);

    searchResult.handle(
      onSuccess: (data) {
        _state = _state.copyWith(recipes: data, isLoading: false);
      },
      onError: (error) {
        _state = _state.copyWith(error: error, isLoading: false);
      },
    );

    notifyListeners();
  }
}
