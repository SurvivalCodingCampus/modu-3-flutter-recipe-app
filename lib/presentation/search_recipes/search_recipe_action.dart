
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipe_action.freezed.dart';

@freezed
sealed class SearchRecipeAction with _$SearchRecipeAction {
  const factory SearchRecipeAction.onFetchAll() = OnFetchAll;
  const factory SearchRecipeAction.onKeywordChanged(String keyword) = OnKeywordChanged;

}

