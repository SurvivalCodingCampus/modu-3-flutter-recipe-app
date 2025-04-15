import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_dto.g.dart';
@JsonSerializable(explicitToJson: true)
class IngredientDto {
  final int? id;
  final String? name;
  final String? image;

  IngredientDto(this.id, this.name, this.image);

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}
