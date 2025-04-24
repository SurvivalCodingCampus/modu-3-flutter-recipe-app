import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/enums/category_filter.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onSelectCategory(CategoryFilter categoryFilter) = OnSelectCategory;
  const factory HomeAction.onTapFavorite(int id) = OnTapFavorite;
  const factory HomeAction.onSearchTap() = OnSearchTap;
  const factory HomeAction.onDishTap(int id) = OnDishTap;
}