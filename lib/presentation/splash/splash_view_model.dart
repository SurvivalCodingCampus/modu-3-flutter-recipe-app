import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:recipe_app/presentation/splash/splash_event.dart';

import '../../core/network/network_status_checker.dart';

class SplashViewModel with ChangeNotifier {
  final NetworkStatusChecker _networkStatusChecker;

  SplashViewModel({required NetworkStatusChecker networkStatusChecker})
    : _networkStatusChecker = networkStatusChecker;

  final _eventController = StreamController<SplashEvent>();
  Stream<SplashEvent> get eventStream => _eventController.stream;

  void connectNetwork() async {
    final isAirplaneModeOn = await _networkStatusChecker.isAirplaneModeOn;

    if (!isAirplaneModeOn) {
      _eventController.add(
        const SplashEvent.NetworkError('에어플레인 모드가 켜져있습니다.'),
      );
    }
  }
}

