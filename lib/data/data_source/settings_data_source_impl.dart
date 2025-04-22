import './settings_data_source.dart';

class SettingsDataSourceImpl implements SettingsDataSource {
  @override
  Future<String> throwWhenFetchSettings() {
    throw Exception('네트워크 연결을 확인해주세요.');
  }
}
