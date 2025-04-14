import 'package:flutter/foundation.dart';
import 'package:recipe_app/presentation/pages/recipe/search/state/filter_state.dart';

class FilterViewModel with ChangeNotifier {
  FilterState _state = const FilterState();
  FilterState get state => _state;

  void filter({String? time, int? rate, String? category}) {
    // 만약 같은 rating을 선택했다면 해제하도록 설정
    if (rate == _state.rate) {
      rate = 0;
    }
    _state = state.copyWith(time: time, rate: rate, category: category);
    notifyListeners();
  }
}
