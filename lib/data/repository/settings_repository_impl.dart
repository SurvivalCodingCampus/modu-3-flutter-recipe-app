import '../../domain/repository/settings_repository.dart';
import '../data_source/settings_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _settingsDataSource;

  const SettingsRepositoryImpl({
    required SettingsDataSource settingsDataSource,
  }) : _settingsDataSource = settingsDataSource;

  @override
  Future<String> throwWhenGetSettings() {
    return _settingsDataSource.throwWhenFetchSettings();
  }
}
