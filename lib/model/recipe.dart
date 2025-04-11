import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/model/ingredients.dart';
import 'package:recipe_app/model/picture.dart';

part 'recipe.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Recipe with _$Recipe {
  final int id;
  final String title;
  final Picture picture;
  final double rate;
  final int cookingTime;
  final String chef;
  final List<Ingredients> ingredients;

  Recipe({
    required this.id,
    required this.title,
    required this.picture,
    required this.rate,
    required this.cookingTime,
    required this.chef,
    required this.ingredients,
  });
}
