
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/presentation/filter_search_bottom_sheet/category_enum.dart';
import 'package:recipe_app/presentation/filter_search_bottom_sheet/time_enum.dart';

part 'filter_search_state.freezed.dart';

part 'filter_search_state.g.dart';

@freezed
abstract class FilterSearchState with _$FilterSearchState {
  const factory FilterSearchState({
    @Default(TimeFilter.all)
    @JsonKey(fromJson: timeFilterFromJson, toJson: timeFilterToJson)
    TimeFilter time,

    @Default(1)
    int rate,

    @Default(CategoryFilter.all)
    @JsonKey(fromJson: categoryFilterFromJson, toJson: categoryFilterToJson)
    CategoryFilter category,
  }) = _FilterSearchState;

  factory FilterSearchState.fromJson(Map<String, Object?> json) => _$FilterSearchStateFromJson(json);
}