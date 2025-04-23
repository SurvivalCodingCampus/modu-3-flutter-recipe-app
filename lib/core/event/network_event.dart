import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_event.freezed.dart';

@freezed
sealed class NetworkEvent with _$NetworkEvent {
  const factory NetworkEvent.networkError(String message) = NetworkError;
}
