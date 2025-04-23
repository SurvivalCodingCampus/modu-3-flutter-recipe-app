import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_screen_action.freezed.dart';

@freezed
sealed class HomeScreenAction with _$HomeScreenAction {
  const factory HomeScreenAction.selectCategory(String category) =
      SelectCategory;
}
