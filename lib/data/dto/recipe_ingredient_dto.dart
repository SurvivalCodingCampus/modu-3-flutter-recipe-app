import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/dto/dto.dart';

part 'recipe_ingredient_dto.g.dart';

@JsonSerializable()
class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final num? amount;

  const RecipeIngredientDto({this.ingredient, this.amount});

  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientDtoToJson(this);
}
