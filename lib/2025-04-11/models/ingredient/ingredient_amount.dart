import 'ingredient.dart';

class IngredientAmount {
  final Ingredient ingredient;
  final int amount;

  const IngredientAmount({
    required this.ingredient,
    required this.amount,
  });

  factory IngredientAmount.fromjson(Map<String, dynamic> json) {
    return IngredientAmount(
        ingredient: Ingredient.fromJson(json['ingredient']),
        amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient.toJson(),
      'amount': amount,
    };
  }
}