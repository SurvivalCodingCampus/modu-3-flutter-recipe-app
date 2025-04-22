import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_tab_state.freezed.dart';

@freezed
class MainTabState with _$MainTabState {
  const MainTabState({required this.currentIndex});

  final int currentIndex;
}
