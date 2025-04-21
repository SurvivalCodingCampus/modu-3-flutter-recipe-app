import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_event.freezed.dart';

@freezed
sealed class SettingEvent with _$SettingEvent {
  const factory SettingEvent.networkError(String message) = NetworkError;
}