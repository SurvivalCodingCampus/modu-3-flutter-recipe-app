import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/search_recipes/filter_search/filter_search_state.dart';

class FilterSearchViewModel with ChangeNotifier {
  FilterSearchState _state = FilterSearchState();

  FilterSearchState get state => _state;

  void timeStringSet({required String timeString}) {
    _state = _state.copyWith(selectTimeString: timeString);
    notifyListeners();
  }

  void rateStringSet({required String rateString}) {
    _state = _state.copyWith(selectRateString: rateString);
    notifyListeners();
  }

  void categoryStringSet({required String categoryString}) {
    _state = _state.copyWith(selectCategoryString: categoryString);
    notifyListeners();
  }

}
