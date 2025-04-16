// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import 'ingredient_dto.dart';

part 'recipe_ingredient_dto.g.dart';

@JsonSerializable()
class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final num? amount;

  RecipeIngredientDto({this.ingredient, this.amount});

  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeIngredientDtoToJson(this);
}
