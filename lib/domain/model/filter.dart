import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

@freezed
class Filter with _$Filter {
  @override
  final String time;
  @override
  final int rate;
  @override
  final String category;

  const Filter({this.time = 'All', this.rate = 0, this.category = 'All'});
}
