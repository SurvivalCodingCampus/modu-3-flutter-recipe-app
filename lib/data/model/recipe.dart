import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_app/data/model/ingredients.dart';
import 'package:recipe_app/data/model/media.dart';
import 'package:recipe_app/data/model/review.dart';

import 'package:recipe_app/data/util/category_enum.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    @JsonKey(name: 'id') @Default(0) final int recipeId,
    @JsonKey(name: 'name') @Default('') final String title,
    @Default([Ingredients()]) final List<Ingredients> ingredients,
    @Default(Review()) final Review review,
    @Default('') final String chef,
    @Default(null) final DateTime? createdAt,
    @JsonKey(name: 'image') @Default('') final String imageUrl,
    @Default(Media()) final Media media,
    @Default([]) final List<String> recipeStep,
    @JsonKey(name: 'time') @Default('') final String cookingTime,
    @Default(Categories.all) final Categories category,
    @Default(0) final double rating,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
