// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'recipe_ingredient.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
    required this.steps,
  });

  final int id;
  final String category;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<RecipeIngredient> ingredients;
  final List<String> steps;
}
