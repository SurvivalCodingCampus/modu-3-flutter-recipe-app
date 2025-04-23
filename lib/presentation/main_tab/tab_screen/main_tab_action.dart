import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_tab_action.freezed.dart';

@freezed
sealed class MainTabAction with _$MainTabAction {
  const factory MainTabAction.onTapTab(int index) = OnTapTab;
  const factory MainTabAction.onTapFAB() = OnTapFAB;
}
