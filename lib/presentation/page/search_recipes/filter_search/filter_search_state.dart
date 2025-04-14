import 'package:freezed_annotation/freezed_annotation.dart';
part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  final List<String> timeFilterList;
  final List<String> rateFilterList;
  final List<String> categoryFilterList;
  final String selectTimeString;
  final String selectRateString;
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
