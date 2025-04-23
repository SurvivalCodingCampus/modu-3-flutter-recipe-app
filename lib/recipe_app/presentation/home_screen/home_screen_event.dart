import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.freezed.dart';

@freezed
sealed class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.showSnackbar(String message) = ShowSnackbar;
}
