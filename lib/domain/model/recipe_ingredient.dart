// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'ingredient.dart';

part 'recipe_ingredient.freezed.dart';

@freezed
class RecipeIngredient with _$RecipeIngredient {
  RecipeIngredient({required this.ingredient, required this.amount});

  final Ingredient ingredient;
  final int amount;
}
