import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/core/enums/time_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class FilterSearchState with _$FilterSearchState{
  final TimeFilter timeFilter;
  final int rateFilter;
  final CategoryFilter categoryFilter;

  const FilterSearchState({
    this.timeFilter = TimeFilter.All,
    this.rateFilter = 0,
    this.categoryFilter = CategoryFilter.All,
  });
}