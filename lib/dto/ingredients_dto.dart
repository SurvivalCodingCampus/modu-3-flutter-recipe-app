import 'package:recipe_app/dto/ingredient_dto.dart';

class IngredientsDto {
  final IngredientDto? ingredientDto;
  final num? amount;

  IngredientsDto({this.ingredientDto, this.amount});

  factory IngredientsDto.fromJson(Map<String, dynamic> json) {
    return IngredientsDto(
      ingredientDto:
          json['ingredient'] != null
              ? IngredientDto.fromJson(json['ingredient'])
              : null,
      amount: json['amount'] as num?,
    );
  }
}
