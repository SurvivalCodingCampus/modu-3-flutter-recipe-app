import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/dto/ingredient_dto.dart';

part 'ingredients_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientsDto {
  final IngredientDto? ingredient;
  final int? amount;

  const IngredientsDto({required this.ingredient, required this.amount});

  factory IngredientsDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsDtoToJson(this);
}
