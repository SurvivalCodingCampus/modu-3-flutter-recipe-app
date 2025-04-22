import 'dart:async';

import 'package:flutter/material.dart';

class SplashViewModel with ChangeNotifier {
  final _controller = StreamController<String>();
  Stream<String> get stream => _controller.stream;

  void networkError() {
    _controller.addError(Exception('네트워크 오류 발생!'));
  }
}
