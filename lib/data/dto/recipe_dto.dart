import 'package:json_annotation/json_annotation.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDto {
  final int? id;
  final String? name;
  final String? image;
  final String? address;

  RecipeDto({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}
