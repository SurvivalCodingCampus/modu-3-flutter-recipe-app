import 'package:flutter/material.dart';
import 'filter_screen_state.dart';

class FilterScreenViewModel with ChangeNotifier {
  FilterScreenState _state = FilterScreenState();
  FilterScreenState get state => _state;

  void updateTime(String selectedTime) {
    _state = _state.copyWith(selectedTime: selectedTime);
    notifyListeners();
  }

  void updateCategory(String selectedCategory) {
    _state = _state.copyWith(selectedCategory: selectedCategory);
    notifyListeners();
  }

  void updateRate(int selectedRate) {
    _state = _state.copyWith(rate: selectedRate);
    notifyListeners();
  }
}
