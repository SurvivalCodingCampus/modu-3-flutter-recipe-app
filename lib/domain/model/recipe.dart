import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/domain/model/pictures.dart';
import 'package:recipe_app/domain/model/step.dart';
import 'package:recipe_app/presentation/component/button/enum/category_type.dart';

part 'recipe.freezed.dart';

// ignore_for_file: annotate_overrides

@freezed
class Recipe with _$Recipe {
  final int id;
  final String title;
  final Pictures pictures;
  final CategoryType category;
  final double rating;
  final int time;
  final String chef;
  final List<Ingredients> ingredients;
  final List<Step> step;

  Recipe({
    required this.id,
    required this.title,
    required this.pictures,
    required this.rating,
    required this.time,
    required this.chef,
    required this.ingredients,
    required this.category,
    required this.step,
  });
}
