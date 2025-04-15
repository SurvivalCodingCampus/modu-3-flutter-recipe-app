import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import '../component/filter_search_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  SearchRecipesState _state = const SearchRecipesState();

  SearchRecipesState get state => _state;

  void setValue(FilterSearchState newValue) {
    _state = state.copyWith(
      filterSearchState: newValue
    );
    notifyListeners();
  }
}