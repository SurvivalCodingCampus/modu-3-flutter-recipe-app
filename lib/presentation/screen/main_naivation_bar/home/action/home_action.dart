import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  const factory HomeAction.updateSelectedCategory(Category category) =
      UpdateSelectedCategory;
  const factory HomeAction.onClickBookMark(int recipeId) = OnClickBookMark;
}
