import 'package:recipe_app/domain/repository/settings_repository.dart';

class ThrowWhenSettingsInfoUseCase {
  final SettingsRepository _settingsRepository;

  const ThrowWhenSettingsInfoUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  Future<String> getSettings() async {
    return _settingsRepository.throwWhenGetSettings();
  }

}