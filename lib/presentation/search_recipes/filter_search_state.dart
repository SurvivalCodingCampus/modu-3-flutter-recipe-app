import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';
import 'package:recipe_app/domain/model/type/rate_type.dart';
import 'package:recipe_app/domain/model/type/time_filter_type.dart';

part 'filter_search_state.freezed.dart';

@freezed
abstract class FilterSearchState with _$FilterSearchState {
  const factory FilterSearchState({
    @Default(TimeFilterType.values) List<TimeFilterType> timeFilterTypes,
    @Default(RateType.values) List<RateType> rateTypes,
    @Default(CategoryFilterType.values) List<CategoryFilterType> categoryFilterTypes,

    @Default(TimeFilterType.all) TimeFilterType selectedTimeFilterType,
    @Default(RateType.one) RateType selectedRateType,
    @Default(CategoryFilterType.all) CategoryFilterType selectedCategoryFilterType,
  }) = _FilterSearchState;
}

