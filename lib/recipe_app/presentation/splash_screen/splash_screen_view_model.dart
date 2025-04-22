import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen_event.dart';

class SplashScreenViewModel with ChangeNotifier {
  final _eventController = StreamController<SplashScreenEvent>();

  Stream<SplashScreenEvent> get eventStream => _eventController.stream;

  void onNetworkError() {
    _eventController.add(SplashScreenEvent.networkError('네트워크 에러'));
  }
}
