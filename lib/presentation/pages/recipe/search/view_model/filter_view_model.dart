import 'package:flutter/foundation.dart';
import 'package:recipe_app/presentation/pages/recipe/search/state/filter_state.dart';

class FilterViewModel with ChangeNotifier {
  FilterState _state = const FilterState();
  FilterState get state => _state;

  void filter({String? time, int? rate, String? category}) {
    _state = state.copyWith(time: time, rate: rate, category: category);
  }
}
