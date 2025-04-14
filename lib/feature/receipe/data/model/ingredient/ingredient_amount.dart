import 'package:recipe_app/feature/receipe/data/model/ingredient/ingredient.dart';

class IngredientAmount {
  final Ingredient ingredient;
  final int amount;

  IngredientAmount({required this.ingredient, required this.amount});

  IngredientAmount copyWith({Ingredient? ingredient, int? amount}) {
    return IngredientAmount(
      ingredient: ingredient ?? this.ingredient,
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() =>
      'IngredientAmount(ingredient: $ingredient, amount: $amount)';

  @override
  bool operator ==(covariant IngredientAmount other) {
    if (identical(this, other)) return true;

    return other.ingredient == ingredient && other.amount == amount;
  }

  @override
  int get hashCode => ingredient.hashCode ^ amount.hashCode;
}
