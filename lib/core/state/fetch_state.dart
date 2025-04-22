import 'package:freezed_annotation/freezed_annotation.dart';
part 'fetch_state.freezed.dart';

@freezed
sealed class RecipeEvent with _$RecipeEvent {
  const factory RecipeEvent.networkError(String message) = networkError;
}
