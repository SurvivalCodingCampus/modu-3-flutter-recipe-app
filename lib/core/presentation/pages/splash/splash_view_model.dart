import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/presentation/pages/splash/splash_event.dart';

class SplashViewModel with ChangeNotifier {
  final _eventController = StreamController<SplashEvent>();

  Stream<SplashEvent> get eventStream => _eventController.stream;

  SplashViewModel() {
    error();
  }

  void error() async {
    await Future.delayed(const Duration(seconds: 2));
    _eventController.add(const SplashEvent.dialog('네트워크 오류입니다.'));
  }
}
