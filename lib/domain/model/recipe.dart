import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String name,
    required String imageUrl,
    required String chef,
    required String totalTimeMinutes,
    required double rating,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
