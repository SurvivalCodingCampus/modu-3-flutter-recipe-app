import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_recipe_screen_event.freezed.dart';

@freezed
sealed class DetailRecipeScreenEvent with _$DetailRecipeScreenEvent {
  const factory DetailRecipeScreenEvent.showMessageBar(String message) =
      ShowMessageBar;

  const factory DetailRecipeScreenEvent.showError(String message) = ShowError;
}
