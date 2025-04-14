import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_bottom_sheet_state.freezed.dart';

@freezed
abstract class FilterSearchBottomSheetState
    with _$FilterSearchBottomSheetState {
  static const List<int> rates = [5, 4, 3, 2, 1];
  static const List<String> categories = [
    'All',
    'Cereal',
    'Vegetables',
    'Dinner',
    'Chinese',
    'Local Dish',
    'Fruit',
    'BreakFast',
    'Spanish',
    'Chinese',
    'Lunch',
  ];

  const factory FilterSearchBottomSheetState({
    @Default(0) int timeIndex,
    @Default(0) int rateIndex,
    @Default([]) List<int> categoryIndicies,
  }) = _FilterSearchBottomSheetState;
}
