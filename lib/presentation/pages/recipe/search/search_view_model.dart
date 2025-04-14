import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/enum/state_enum.dart';
import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/core/modules/state/base_state.dart';
import 'package:recipe_app/feature/receipe/data/model/recipe.dart';
import 'package:recipe_app/feature/receipe/data/repository/search/search_recipe_repository.dart';
import 'package:recipe_app/presentation/pages/recipe/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final SearchRecipeRepository _searchRepository;

  SearchViewModel(this._searchRepository);

  ListBaseState<Recipe> _state = const SearchState();
  ListBaseState<Recipe> get state => _state;

  void fetchSearchData() async {
    try {
      _state = state.copyWith(viewState: ViewState.loading);
      final response = await _searchRepository.getRecipes();
      switch (response) {
        case Success<List<Recipe>>():
          _state = state.copyWith(
            data: response.data,
            viewState: ViewState.complete,
          );
        case Error<List<Recipe>>():
          _state = state.copyWith(viewState: ViewState.error);
      }
      notifyListeners();
    } catch (e) {
      _state = state.copyWith(viewState: ViewState.error);
    }
  }
}
