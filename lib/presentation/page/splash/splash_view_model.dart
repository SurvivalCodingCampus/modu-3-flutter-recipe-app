import 'package:flutter/material.dart';
import 'splash_state.dart';

class SplashViewModel with ChangeNotifier {
  SplashState _state = const SplashState();

  SplashState get state => _state;

  void stateChange() {
    Future.delayed(Duration(seconds: 1), () async {
      _state = _state.copyWith(isBackGroundVisible: true);
      notifyListeners();
    }).then((_) async {
      await overlayChange().then((_) async {
        await logoChange().then((_) async {
          await logoTextChange();
        });
      });
    });
  }

  Future overlayChange() async {
    await Future.delayed(Duration(seconds: 3), () {
      _state = _state.copyWith(isOverlayVisible: true);
      notifyListeners();
    });
  }

  Future logoChange() async {
    await Future.delayed(Duration(seconds: 3), () async {
      _state = _state.copyWith(isLogoVisible: true);
      notifyListeners();
    });
  }

  Future logoTextChange() async {
    await Future.delayed(Duration(seconds: 3), () async {
      _state = _state.copyWith(isTextVisible: true);
      notifyListeners();
    });
  }
}