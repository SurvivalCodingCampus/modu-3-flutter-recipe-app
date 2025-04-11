import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Recipe with _$Recipe {
  final String id;
  final String title;
  final String imageUrl;
  final double rate;
  final int cookingTime;

  Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rate,
    required this.cookingTime,
  });
}
