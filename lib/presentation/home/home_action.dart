import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onTapBookmark(int recipeId) = OnTapBookmark;
  const factory HomeAction.onTapCard(int recipeId) = OnTapCard;
  const factory HomeAction.onTapSearchBar() = OnTapSearchBar;
  const factory HomeAction.onTapCategory(String category) = OnTapCategory;
}
