// [Filter]검색 필터에 필요한 정보를 담고 있습니다..
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Filter with _$Filter {
  final Time time;
  final Rate rate;
  final Category category;

  Filter({required this.time, required this.rate, required this.category});
}

enum Time { all, newest, oldest, popularity }

enum Rate { one, two, three, four, five }

extension RateValue on Rate {
  int get value => index + 1;
}

enum Category {
  cereal,
  vegetables,
  dinner,
  chiness,
  localDish,
  fruit,
  breakfast,
  spanish,
  lunch,
}
