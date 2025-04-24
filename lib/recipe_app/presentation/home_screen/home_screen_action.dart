import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/recipe.dart';

part 'home_screen_action.freezed.dart';

@freezed
sealed class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.selectCategory(String category) =
      SelectCategory;

  const factory HomeScreenAction.removeBookMark(int id) = RemoveBookMark;

  const factory HomeScreenAction.addBookMark(Recipe recipe) = AddBookMark;
}
