import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipes_action.freezed.dart';

@freezed
sealed class SearchRecipesAction with _$SearchRecipesAction{
  const factory SearchRecipesAction.onValueChange(String value) = OnValueChange;
  const factory SearchRecipesAction.onFilterTap() = OnFilterTap;
}