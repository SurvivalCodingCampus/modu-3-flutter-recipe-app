import 'package:json_annotation/json_annotation.dart';

import 'recipe_ingredient_dto.dart';

part 'recipe_dto.g.dart';

@JsonSerializable()
class RecipeDto {
  final num? id;
  final String? category;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final num? rating;
  final List<RecipeIngredientDto>? ingredients;

  RecipeDto({
    this.id,
    this.category,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}
