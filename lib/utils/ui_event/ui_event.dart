import 'package:freezed_annotation/freezed_annotation.dart';
part 'ui_event.freezed.dart';

@freezed
sealed class UiEvent<T> with _$UiEvent<T> {
  const factory UiEvent.networkError(String message) = NetworkError;
}
