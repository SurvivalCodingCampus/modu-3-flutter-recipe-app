import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_api_event.freezed.dart';

@freezed
sealed class NetworkApiEvent<T> with _$NetworkApiEvent<T> {
  const factory NetworkApiEvent.showErrorMessage(String message) =
      ShowErrorMessage;
}
