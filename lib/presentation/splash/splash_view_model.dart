import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/error/network_api_event.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/usecase/check_network_error_use_case.dart';

class SplashViewModel with ChangeNotifier {
  final CheckNetworkErrorUseCase _checkNetworkErrorUseCase;
  final _eventController = StreamController<NetworkApiEvent>();
  Stream<NetworkApiEvent> get eventStream => _eventController.stream;

  SplashViewModel(this._checkNetworkErrorUseCase);

  Future<void> load() async {
    final result = await _checkNetworkErrorUseCase.execute(notUsed: false);

    if (result is UiError) {
      _eventController.add(NetworkApiEvent.showErrorMessage(result.message));
    }
  }
}
