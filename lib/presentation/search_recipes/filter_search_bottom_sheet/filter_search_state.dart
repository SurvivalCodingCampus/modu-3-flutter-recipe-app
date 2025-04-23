import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  final TimeFilter time;
  final RateFilter rate;
  final CategoryFilter category;

  const FilterSearchState({
    this.time = TimeFilter.all,
    this.rate = RateFilter.one,
    this.category = CategoryFilter.all,
  });

}

enum TimeFilter { all, newest, oldest, popularity}
enum RateFilter { one, two, three, four, five }
enum CategoryFilter { all, cereal, vegetables, dinner, chinese, localDish, fruit, breakfast, spanish, lunch}