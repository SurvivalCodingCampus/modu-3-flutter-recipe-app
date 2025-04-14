import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/data/util/rate_enum.dart';
import 'package:recipe_app/data/util/time_enum.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_state.dart';

class FilterSearchViewModel with ChangeNotifier {

  FilterSearchState _state = FilterSearchState();

  FilterSearchState get state => _state;

  void onTapButton(Enum filterEnum) {
    _state = _state.copyWith(isLoading: true);
    if (filterEnum is Time) {
      if (_state.filter.times.contains(filterEnum)) {
        _state = _state.copyWith(
          isLoading: false,
          filter: _state.filter.copyWith(
            times:
                _state.filter.times
                    .where((element) => element != filterEnum)
                    .toList(),
          ),
        );
      } else {
        _state = _state.copyWith(
          isLoading: false,
          filter: _state.filter.copyWith(
            times: [..._state.filter.times, filterEnum],
          ),
        );
      }
    } else if (filterEnum is Rate) {
      if (_state.filter.rates.contains(filterEnum)) {
        _state = _state.copyWith(
          isLoading: false,
          filter: _state.filter.copyWith(
            rates:
                _state.filter.rates
                    .where((element) => element != filterEnum)
                    .toList(),
          ),
        );
      } else {
        _state = _state.copyWith(
          isLoading: false,
          filter: _state.filter.copyWith(
            rates: [..._state.filter.rates, filterEnum],
          ),
        );
      }
    } else if (filterEnum is Categories) {
      if (_state.filter.categories.contains(filterEnum)) {
        _state = _state.copyWith(
          isLoading: false,
          filter: _state.filter.copyWith(
            categories:
                _state.filter.categories
                    .where((element) => element != filterEnum)
                    .toList(),
          ),
        );
      } else {
        _state = _state.copyWith(
          isLoading: false,
          filter: _state.filter.copyWith(
            categories: [..._state.filter.categories, filterEnum],
          ),
        );
      }
    }
    print(_state);
  }
}
