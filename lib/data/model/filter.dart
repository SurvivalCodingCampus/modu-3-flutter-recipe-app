import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/data/util/rate_enum.dart';
import 'package:recipe_app/data/util/time_enum.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
abstract class Filter with _$Filter {
  const factory Filter({
    @Default([]) final List<Time> times,
    @Default([]) final List<Rate?> rates,
    @Default([]) final List<Categories> categories,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
