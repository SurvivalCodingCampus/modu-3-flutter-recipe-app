import 'ingredient_dto.dart';

class IngredientWithAmountDto {
  IngredientDto? ingredient;
  num? amount;

  IngredientWithAmountDto({this.ingredient, this.amount});

  factory IngredientWithAmountDto.fromJson(Map<String, dynamic> json) {
    return IngredientWithAmountDto(
      ingredient: json['ingredient'] != null
          ? IngredientDto.fromJson(json['ingredient'])
          : null,
      amount: json['amount'] as num?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ingredient': ingredient?.toJson(),
    'amount': amount,
  };
}