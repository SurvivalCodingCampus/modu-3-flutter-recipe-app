// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/presentation/splash/splash_event.dart';

class SplashViewModel with ChangeNotifier {
  final NetworkRepository _networkRepository;

  SplashViewModel({required NetworkRepository networkRepository})
    : _networkRepository = networkRepository;

  final _eventController = StreamController<SplashEvent>();

  Stream<SplashEvent> get eventStream => _eventController.stream;

  void fetchNetwork() async {
    final networkStatus = await _networkRepository.hasNetwork();

    if (!networkStatus) {
      _eventController.add(
        const SplashEvent.showNetworkError('알 수 없는 네트워크 오류'),
      );
    }
  }
}
