import 'ingredient_dto.dart';

class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final int? amount;

  RecipeIngredientDto({this.ingredient, this.amount});

  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientDto(
      ingredient:
          json['ingredient'] != null
              ? IngredientDto.fromJson(json['ingredient'])
              : null,
      amount: json['amount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ingredient': ingredient?.toJson(),
    'amount': amount,
  };
}
