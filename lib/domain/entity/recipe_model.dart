import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required String category,
    required String name,
    required String image,
    required String chef,
    required String time,
    required double rating,
    required List<RecipeIngredient> ingredients,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class RecipeIngredient with _$RecipeIngredient {
  const factory RecipeIngredient({
    required Ingredient ingredient,
    required int amount,
  }) = _RecipeIngredient;

  factory RecipeIngredient.fromJson(Map<String, dynamic> json) => _$RecipeIngredientFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required int id,
    required String name,
    required String image,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
