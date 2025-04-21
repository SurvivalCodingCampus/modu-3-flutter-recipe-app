
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/presentation/splash/splash_event.dart';

class SplashViewModel with ChangeNotifier {

  final _eventController = StreamController<SplashEvent>();
  Stream<SplashEvent> get eventStream => _eventController.stream;

  Future<bool> checkNetwork() async {
    var connetivityResult = await Connectivity().checkConnectivity();

    if (connetivityResult.contains(ConnectivityResult.none)) {
      onNetworkError();
      return false;
    } else {
      return true;
    }
  }

  void onNetworkError() {
    _eventController.add(SplashEvent.networkError('네트워크 에러'));
  }
  void onSuccess() {
    _eventController.add(SplashEvent.networkSuccess('이동'));
  }
  void dispose() {
    _eventController.close();
  }

}