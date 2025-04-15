import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  @override
  final List<String> timeFilterList;
  @override
  final List<String> rateFilterList;
  @override
  final List<String> categoryFilterList;
  @override
  final String selectTimeString;
  @override
  final String selectRateString;
  @override
  final String selectCategoryString;

  const FilterSearchState({
    this.timeFilterList = const ['All', 'Newest', 'Oldest', 'Popularity'],
    this.rateFilterList = const ['5', '4', '3', '2', '1'],
    this.categoryFilterList = const [
      'All',
      'Cereal',
      'Vegetables',
      'Dinner',
      'Chinese',
      'Local Dish',
      'Fruit',
      'BreakFast',
      'Spanish',
      'Lunch',
    ],
    this.selectTimeString = 'All',
    this.selectRateString = '5',
    this.selectCategoryString = 'All',
  });
}
