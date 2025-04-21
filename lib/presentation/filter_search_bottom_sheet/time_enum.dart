import 'package:flutter/foundation.dart';

enum TimeFilter { all, newest, oldest, popularity }

extension TimeFilterExt on TimeFilter {
  String get label {
    switch (this) {
      case TimeFilter.all: return 'All';
      case TimeFilter.newest: return 'Newest';
      case TimeFilter.oldest: return 'Oldest';
      case TimeFilter.popularity: return 'Popularity';
    }
  }
}

TimeFilter timeFilterFromJson(String value) =>
    TimeFilter.values.firstWhere((e) => e.name == value);

String timeFilterToJson(TimeFilter filter) => filter.name;