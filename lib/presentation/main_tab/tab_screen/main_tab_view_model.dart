import 'package:flutter/material.dart';

import 'main_tab_action.dart';
import 'main_tab_state.dart';

class MainTabViewModel with ChangeNotifier {
  MainTabState _state = const MainTabState(currentIndex: 0);
  MainTabState get state => _state;

  void onAction(MainTabAction action) {
    switch (action) {
      case OnTapTab(:final index):
        _state = _state.copyWith(currentIndex: index);
        notifyListeners();
        break;
      case OnTapFAB():
        // 예: 업로드 화면 이동 로직 등
        break;
    }
  }
}
