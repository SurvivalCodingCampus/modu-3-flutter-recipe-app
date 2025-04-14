import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientDto {
  final int? id;
  final String? name;
  final String? image;

  const IngredientDto({
    required this.id,
    required this.name,
    required this.image,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}
