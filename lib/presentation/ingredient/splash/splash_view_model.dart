import 'dart:async';

import 'package:recipe_app/core/enums/network_error.dart';
import 'package:recipe_app/core/event/setting_event.dart';
import 'package:recipe_app/core/result/result.dart';
import 'package:recipe_app/domain/repository/setting_repository.dart';

class SplashViewModel {
  final SettingRepository _settingRepository;

  final _eventController = StreamController<SettingEvent>();
  Stream<SettingEvent> get eventStream => _eventController.stream;

  SplashViewModel({
    required SettingRepository settingRepository,
  }) : _settingRepository = settingRepository {
    checkNetwork();
  }

  void checkNetwork() async {
    final result = await _settingRepository.getNetwork();
    switch (result) {
    // 성공일 떼
      case Success<String, NetworkErrorType>():
        print(result.data);

    // 에러일 때
      case Error<String, NetworkErrorType>():
        switch (result.error) {
          case NetworkErrorType.unknown:
            _eventController.add(SettingEvent.networkError('네트워크 에러 발생'));
        }
    }
  }
}