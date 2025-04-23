import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_screen_event.freezed.dart';

@freezed
sealed class SearchRecipesScreenEvent with _$SearchRecipesScreenEvent {
  const factory SearchRecipesScreenEvent.showSnackbar(String message) =
      ShowSnackbar;
}
