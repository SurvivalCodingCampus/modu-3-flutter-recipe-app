import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_recipes_action.freezed.dart';

@freezed
sealed class DetailRecipesAction with _$DetailRecipesAction {
  const factory DetailRecipesAction.toggleMoreMenu() = ToggleMoreMenu;
  const factory DetailRecipesAction.closeMoreMenu() = CloseMoreMenu;
}