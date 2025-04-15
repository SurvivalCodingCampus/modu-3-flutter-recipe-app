import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  final int value;
  final bool switchValue;

  const FilterSearchState({required this.value, required this.switchValue});
}
