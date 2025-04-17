// [Filter]검색 필터에 필요한 정보를 담고 있습니다..
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';

part 'filter_search_state.freezed.dart';
part 'filter_search_state.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class FilterSearchState with _$FilterSearchState {
  final Time time;
  final int rate;
  final Category category;

  const FilterSearchState({
    this.time = Time.all,
    this.rate = 0,
    this.category = Category.all,
  });
}
