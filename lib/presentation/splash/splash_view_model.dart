import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/event/network_event.dart';

class SplashViewModel with ChangeNotifier {
  final _eventController = StreamController<NetworkEvent>();

  Stream<NetworkEvent> get eventStream => _eventController.stream;

  void onNetworkError() {
    _eventController.add(const NetworkEvent.networkError('네트워크 에러 발생'));
  }
}
