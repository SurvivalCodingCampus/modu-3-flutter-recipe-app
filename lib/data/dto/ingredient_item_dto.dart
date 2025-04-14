import 'ingredient_dto.dart';

class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final int? amount;
  final int? recipeId;

  RecipeIngredientDto({this.ingredient, this.amount, this.recipeId});

  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientDto(
      ingredient:
          json['ingredient'] != null
              ? IngredientDto.fromJson(json['ingredient'])
              : null,
      amount: json['amount'] as int?,
      recipeId: json['recipeId'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'ingredient': ingredient?.toJson(),
    'amount': amount,
    'recipeId': recipeId,
  };
}
