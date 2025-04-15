import 'package:recipe_app/data/model/ingredient_with_amount.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/core/enums/category_filter.dart';

part 'recipe.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Recipe with _$Recipe {
  final int id;
  final CategoryFilter category;
  final String name;
  final String time;
  final String chef;
  final double rating;
  final String image;
  final List<IngredientWithAmount> ingredients;

  const Recipe({
    required this.id,
    required this.category,
    required this.name,
    required this.time,
    required this.chef,
    required this.rating,
    required this.image,
    required this.ingredients
  });

  // final int commentCount;
  // final int serve;
  // final String video;
  // final CategoryFilter category;
  // final List<Ingredient> ingredients;
  // final List<String> steps;
}