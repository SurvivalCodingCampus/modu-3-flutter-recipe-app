import 'package:freezed_annotation/freezed_annotation.dart';
import 'ingredient.dart';
part 'ingredient_with_amount.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class IngredientWithAmount with _$IngredientWithAmount {
  final Ingredient ingredient;
  final int amount;

  const IngredientWithAmount({required this.ingredient, required this.amount});
}
