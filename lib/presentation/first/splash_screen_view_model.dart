import 'package:flutter/material.dart';

class SplashScreenViewModel with ChangeNotifier {
  SplashScreenViewModel();

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> fetchApp() async {
    _isLoading = true;
    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }
}
