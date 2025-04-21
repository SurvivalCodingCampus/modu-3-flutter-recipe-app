import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

@freezed
sealed class SplashEvent<T> with _$SplashEvent<T> {
  const factory SplashEvent.airplaneModeError(String message) = AirplaneModeError;
  const factory SplashEvent.networkError(String message) = networkError;
  const factory SplashEvent.timeoutError(String message) = timeoutError;
}