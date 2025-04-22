import 'package:flutter/material.dart';

import 'home_action.dart';
import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  HomeState _state = const HomeState(isLoading: false, recipes: []);
  HomeState get state => _state;

  void onAction(HomeAction action) {
    switch (action) {
      case TapRecipe(:final recipeId):
        // TODO: 상세 화면 이동 등 처리
        break;
    }
  }

  void load() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 600));
    _state = _state.copyWith(isLoading: false, recipes: []);
    notifyListeners();
  }
}
