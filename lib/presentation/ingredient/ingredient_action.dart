import 'package:freezed_annotation/freezed_annotation.dart';
part 'ingredient_action.freezed.dart';

@freezed
sealed class IngredientAction with _$IngredientAction {
  const factory IngredientAction.onTapClick(int tabIndex) = OnTapClick;
  const factory IngredientAction.onMenuClick(int menuIndex) = OnMenuClick;
}
