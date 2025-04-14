import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _repository;

  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesViewModel(this._repository);

  SearchRecipesState get state => _state;

  Future<void> fetchAll() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    List<Recipe> recipes = await _repository.findAll();
    _state = _state.copyWith(recipes: recipes, isLoading: false);
    notifyListeners();
  }

  Future<void> setSearchFilter(FilterSearchBottomSheetState state) async {
    _state = _state.copyWith(bottomSheetFilter: state);
    notifyListeners();
  }

  Future<void> searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    _state = _state.copyWith(
      query: query,
      recipes: await _repository.findAll(),
    );

    _state = _state.copyWith(
      recipes:
          state.recipes
              .where(
                (recipe) =>
                    recipe.name.toLowerCase().contains(query.toLowerCase()),
              )
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
