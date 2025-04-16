import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final SearchRecipesUseCase _searchRecipesUseCase;
  final GetSavedRecipesUseCase _getSavedRecipesUseCase;

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesViewModel(
    this._searchRecipesUseCase,
    this._getSavedRecipesUseCase,
  );

  SearchRecipesState get state => _state;

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    List<Recipe> recipes = await _getSavedRecipesUseCase.execute();
    _state = _state.copyWith(recipes: recipes, isLoading: false);
    notifyListeners();
  }

  Future<void> setSearchFilter(FilterSearchBottomSheetState state) async {
    _state = _state.copyWith(bottomSheetFilter: state);
    notifyListeners();
  }

  Future<void> searchRecipes(String query) async {
    _state = _state.copyWith(query: query, isLoading: true);
    notifyListeners();

    final List<Recipe> recipes = await _searchRecipesUseCase.execute(query);

    _state = _state.copyWith(
      recipes:
          recipes
              .where(
                (recipe) =>
                    recipe.rating ==
                    FilterSearchBottomSheetState.rates[state
                        .bottomSheetFilter
                        .rateIndex],
              )
              .toList(),
    );

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
