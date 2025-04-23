import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_screen_event.freezed.dart';

@freezed
sealed class SavedRecipesScreenEvent with _$SavedRecipesScreenEvent {
  const factory SavedRecipesScreenEvent.showSnackbar(String message) =
      ShowSnackbar;
}
