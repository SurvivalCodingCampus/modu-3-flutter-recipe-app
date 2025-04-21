import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final List<Map<String, dynamic>> searchData;

  const HomeState({this.searchData = const []});
}
