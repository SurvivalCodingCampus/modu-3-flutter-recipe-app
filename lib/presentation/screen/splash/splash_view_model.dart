import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/domain/repository/network_error_repository.dart';
import 'package:recipe_app/presentation/screen/splash/event/splash_event.dart';

class SplashViewModel with ChangeNotifier {
  final NetworkErrorRepository _errorRepository;

  SplashViewModel({required NetworkErrorRepository errorRepository})
    : _errorRepository = errorRepository;

  final _eventController = StreamController<SplashEvent>();
  Stream<SplashEvent> get eventStream => _eventController.stream;

  // 네트워크에러 (비행가모드시)
  void onNetworkError() {
    _eventController.add(SplashEvent.networkError('네트웨크 연결을 확인해주세요!'));
  }

  // 홈으로 이동
  void goHome() {
    _eventController.add(SplashEvent.goHome('홈으로 이동합니다.'));
  }

  void fetchNetworkError() async {
    final networkStatus = await _errorRepository.onNetworkError();
    if (networkStatus) {
      _eventController.add(const SplashEvent.networkError('알 수 없는 네트워크 오류'));
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
