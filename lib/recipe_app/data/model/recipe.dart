import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String category,
    required int id,
    required String name,
    required String chef,
    required double rate,
    required int time,
    required String image,
    required List<Ingredient> ingredients,
    required bool bookMarked,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, Object?> json) => _$RecipeFromJson(json);
}
