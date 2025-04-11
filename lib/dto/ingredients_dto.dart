import 'package:recipe_app/dto/ingredient_dto.dart';

class IngredientsDto {
  final Ingredient? ingredient;
  final num? amount;

  IngredientsDto({this.ingredient, this.amount});

  factory IngredientsDto.fromJson(Map<String, dynamic> json) {
    return IngredientsDto(
      ingredient:
          json['ingredient'] != null
              ? Ingredient.fromJson(json['ingredient'])
              : null,
      amount: json['amount'] as num?,
    );
  }
}
