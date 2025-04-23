import 'package:flutter/material.dart';

import 'main_tab_action.dart';

class MainTabViewModel with ChangeNotifier {
  void onAction(MainTabAction action) {
    switch (action) {
      case OnTapFAB():
        // 애니메이션, 전환, 트래킹
        break;
      case OnTapTab(:final index):
        // 차후 애니메이션 처리
        break;
    }
  }
}
