import 'package:flutter/foundation.dart';
import 'package:recipe_app/feature/receipe/presentation/filter_modal/filter_search_state.dart';
import 'package:recipe_app/feature/receipe/presentation/search_recipes/search_view_model.dart';

class FilterSearchViewModel with ChangeNotifier {
  final SearchViewModel _searchViewModel;
  FilterSearchViewModel(this._searchViewModel);

  FilterSearchState _originalState = const FilterSearchState();
  FilterSearchState _state = const FilterSearchState();
  FilterSearchState get state => _state;

  // 뷰 데이터 변경
  void changeData({String? time, int? rate, String? category}) {
    _state = state.copyWith(
      time: time ?? _state.time,
      rate: rate == state.rate ? 0 : (rate ?? _state.rate),
      category: category ?? _state.category,
    );
    notifyListeners();
  }

  // 실제 데이터 변경
  void changeOriginalData() {
    _originalState = _originalState.copyWith(
      time: _state.time,
      rate: _state.rate,
      category: _state.category,
    );
    notifyListeners();
  }

  // 데이터 리셋
  void resetData() {
    _state = _originalState.copyWith();
  }

  // 데이터 필터링
  void filterData() {
    changeOriginalData();
    notifyListeners();
    _searchViewModel.filterData(
      time: _state.time,
      rate: _state.rate,
      category: _state.category,
    );
  }
}
