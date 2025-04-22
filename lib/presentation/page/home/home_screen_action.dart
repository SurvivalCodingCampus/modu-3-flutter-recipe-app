import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';

part 'home_screen_action.freezed.dart';

@freezed
sealed class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.onTapSearchBar({
    required List<Recipe> searchData,
  }) = OnTapSearchBar;
}