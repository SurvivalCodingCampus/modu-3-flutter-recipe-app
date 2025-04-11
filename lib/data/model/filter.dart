import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/data/util/rate_enum.dart';
import 'package:recipe_app/data/util/time_enum.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
abstract class Filter with _$Filter {
  const factory Filter({
    @Default(Time.all) final Time time,
    @Default(Rate.star1) final Rate rate,
    @JsonKey() @Default(Categories.all) final Categories category,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
