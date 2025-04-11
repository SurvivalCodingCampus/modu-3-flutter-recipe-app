// ignore_for_file: unused_element

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/category.dart';
import 'package:recipe_app/data/model/ingredient.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required int id,
    required Category category,
    required String name,
    required String imageUrl,
    required double rating,
    required int cookTime,
    required List<Ingredient> ingredients,
  }) = _Recipe;
}
