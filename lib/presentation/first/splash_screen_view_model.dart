import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

    try {
      final response = await http.get(Uri.parse('https://www.google.com'));
    } on SocketException {
      onNetworkError();
    }

    await Future.delayed(const Duration(seconds: 1));
    _isLoading = false;
    notifyListeners();
  }
}
