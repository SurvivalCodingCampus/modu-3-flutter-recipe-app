import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/state/fetch_state.dart';

class SplashScreenViewModel with ChangeNotifier {
  SplashScreenViewModel();

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  final _eventController = StreamController<RecipeEvent>();

  Stream<RecipeEvent> get eventStream => _eventController.stream;

  void onNetworkError() {
    _eventController.add(RecipeEvent.networkError('Network Error'));
  }

  Future<void> fetchApp() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    onNetworkError();

    _isLoading = false;
    notifyListeners();
  }
}
