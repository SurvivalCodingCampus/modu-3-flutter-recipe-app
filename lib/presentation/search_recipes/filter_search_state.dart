import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/filter.dart';


part 'filter_search_state.freezed.dart';
part 'filter_search_state.g.dart';

@freezed
abstract class FilterSearchState with _$FilterSearchState{
  const factory FilterSearchState({
    @Default(Filter()) final Filter filter,
    @Default(false) final bool isLoading,
  }) = _FilterSearchState;

  factory FilterSearchState.fromJson(Map<String, dynamic> json) => _$FilterSearchStateFromJson(json);
}