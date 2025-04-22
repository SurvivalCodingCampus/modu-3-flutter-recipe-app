import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_data_dto.g.dart';

@JsonSerializable()
class SearchDataDto {
  final String? query;
  final num? rate;
  final List<String>? categories;

  SearchDataDto({this.query, this.rate, this.categories = const []});

  factory SearchDataDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SearchDataDtoToJson(this);
}
