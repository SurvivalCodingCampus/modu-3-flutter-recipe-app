// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

@freezed
class FilterSearchState with _$FilterSearchState {
  const FilterSearchState({
    this.time = FilterTime.all,
    this.rate,
    this.categories = const [],
  });

  final FilterTime time;
  final int? rate;
  final List<FilterCategory> categories;

  bool get isinitial =>
      (time == FilterTime.all && rate == null && categories.isEmpty);
}

enum FilterTime { all, newest, oldest, popularity }

enum FilterCategory {
  all,
  cereal,
  vegetables,
  dinner,
  chinese,
  localDish,
  fruit,
  breakfast,
  spanish,
  lunch,
  indian,
  asian,
  japanese,
  american,
  british,
  italian,
  french,
  korean,
}

extension FilterTimeLabel on FilterTime {
  String get label {
    switch (this) {
      case FilterTime.all:
        return 'All';
      case FilterTime.newest:
        return 'Newest';
      case FilterTime.oldest:
        return 'Oldest';
      case FilterTime.popularity:
        return 'Popularity';
    }
  }
}

extension FilterCategoryLabel on FilterCategory {
  String get label {
    switch (this) {
      case FilterCategory.all:
        return 'All';
      case FilterCategory.cereal:
        return 'Cereal';
      case FilterCategory.vegetables:
        return 'Vegetables';
      case FilterCategory.dinner:
        return 'Dinner';
      case FilterCategory.chinese:
        return 'Chinese';
      case FilterCategory.localDish:
        return 'Local Dish';
      case FilterCategory.fruit:
        return 'Fruit';
      case FilterCategory.breakfast:
        return 'Breakfast';
      case FilterCategory.spanish:
        return 'Spanish';
      case FilterCategory.lunch:
        return 'Lunch';
      case FilterCategory.indian:
        return 'Indian';
      case FilterCategory.asian:
        return 'Asian';
      case FilterCategory.japanese:
        return 'Japanese';
      case FilterCategory.american:
        return 'American';
      case FilterCategory.british:
        return 'British';
      case FilterCategory.italian:
        return 'Italian';
      case FilterCategory.french:
        return 'French';
      case FilterCategory.korean:
        return 'Korean';
    }
  }
}
