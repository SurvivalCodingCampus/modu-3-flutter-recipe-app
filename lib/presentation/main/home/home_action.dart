import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/recipe_model.dart';
part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onSelectCategory(String category) = OnSelectCategory;
  const factory HomeAction.onTapFavorite(Recipe recipe) = OnTapFavorite;
}
