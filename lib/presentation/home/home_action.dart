import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/model.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.onTapSearch() = OnTapSearch;
  const factory HomeAction.onTapCategory(String category) = OnTapCategory;
  const factory HomeAction.onTapFavorite(Recipe recipe) = OnTapRecipe;
}
