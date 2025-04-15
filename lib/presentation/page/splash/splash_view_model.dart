import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  bool _isBackGroundVisible = false;

  bool _isOverlayVisible = false;

  bool _isLogoVisible = false;

  bool _isTextVisible = false;

  final bool _isButtonVisible = false;

  bool get isBackGroundVisible => _isBackGroundVisible;

  bool get isOverlayVisible => _isOverlayVisible;

  bool get isLogoVisible => _isLogoVisible;

  bool get isTextVisible => _isTextVisible;

  bool get isButtonVisible => _isButtonVisible;

  void stateChange() {
    Future.delayed(Duration(seconds: 1), () async {
      _isBackGroundVisible = true;
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
      _isOverlayVisible = true;
      notifyListeners();
    });
  }

  Future logoChange() async {
    await Future.delayed(Duration(seconds: 3), () async {
      _isLogoVisible = true;
      notifyListeners();
    });
  }

  Future logoTextChange() async {
    await Future.delayed(Duration(seconds: 3), () async {
      _isTextVisible = true;
      notifyListeners();
    });
  }
}
