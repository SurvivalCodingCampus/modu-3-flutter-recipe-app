import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/model/ingredient.dart';

part 'ingredients.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Ingredients with _$Ingredients {
  final Ingredient ingredient;
  final int amount;

  Ingredients({required this.ingredient, required this.amount});
}
