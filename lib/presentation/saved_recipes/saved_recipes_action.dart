import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_action.freezed.dart';

@freezed
sealed class SavedRecipesAction with _$SavedRecipesAction {
  const factory SavedRecipesAction.onTapCard(int id) = OnTapCard;
  const factory SavedRecipesAction.onTapSave(int id) = OnTapSave;
}
