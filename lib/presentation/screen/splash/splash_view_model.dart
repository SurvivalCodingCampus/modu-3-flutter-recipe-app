import 'dart:async';
import 'dart:io'; // 인터넷 체크를 위해 필요
import 'package:recipe_app/presentation/event/ui_event.dart';

class SplashViewModel {
  final _eventController = StreamController<UiEvent>.broadcast();
  Stream<UiEvent> get eventStream => _eventController.stream;

  void checkNetwork() {
    try {
      // 실제 네트워크 연결 확인 (example.com 대체)
      InternetAddress.lookup('example.com').then((result) {
        if (result.isEmpty || result[0].rawAddress.isEmpty) {
          _eventController.add(ShowSnackBar('네트워크에 연결할 수 없습니다.'));
        }
      }).catchError((_) {
        _eventController.add(ShowSnackBar('네트워크에 연결할 수 없습니다.'));
      });
    } catch (_) {
      _eventController.add(ShowSnackBar('네트워크에 연결할 수 없습니다.'));
    }
  }

  void dispose() {
    _eventController.close();
  }
}
