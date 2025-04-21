import 'network_status_checker.dart';

class MockNetwrokStatusCheckerImpl implements NetworkStatusChecker {

  @override
  Future<bool> get isAirplaneModeOn async {
    return false;  //에러사항 목데이터
  }
}
