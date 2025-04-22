import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/splash/splash_event.dart';
import 'splash_state.dart';

class SplashViewModel with ChangeNotifier {
  final _eventController = StreamController<SplashEvent>();

  Stream<SplashEvent> get eventStream => _eventController.stream;

  SplashState _state = const SplashState();

  SplashState get state => _state;

  Future<void> stateChange() async {
    await Future.delayed(Duration(seconds: 1));
    _state = _state.copyWith(isBackGroundVisible: true);
    notifyListeners();

    await overlayChange();
    await logoChange();
    await logoTextChange();

    if (_state.isOverlayVisible) {
      _state = state.copyWith(isInternetAvailable: await isInternetAvailable());
    }
  }

  Future<void> overlayChange() async {
    await Future.delayed(Duration(seconds: 3));
    _state = _state.copyWith(isOverlayVisible: true);
    notifyListeners();
  }

  Future<void> logoChange() async {
    await Future.delayed(Duration(seconds: 3));
    _state = _state.copyWith(isLogoVisible: true);
    notifyListeners();
  }

  Future<void> logoTextChange() async {
    await Future.delayed(Duration(seconds: 3));
    _state = _state.copyWith(isTextVisible: true);
    notifyListeners();
  }

  Future<bool> isInternetAvailable() async {
    try {
      // 강제로 예외 발생시켜 테스트
      throw SocketException("인터넷 연결 안됨 (모의)");

      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (_) {
      _eventController.add(
        const SplashEvent.showErrorMessage('인터넷 연결이 안되어 있습니다'),
      );
    }
    return false;
  }
}
