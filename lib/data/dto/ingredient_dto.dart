import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable()
class IngredientDto {
  final num? id;
  final String? name;
  final String? image;
  final num? amount;

  const IngredientDto({this.id, this.name, this.image, this.amount});

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}
