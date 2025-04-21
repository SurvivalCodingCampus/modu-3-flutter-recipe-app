
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

@freezed
sealed class SplashEvent<T> with _$SplashEvent<T> {
  const factory SplashEvent.showErrorMessage(String message) = ShowErrorMessage<T>;
}
