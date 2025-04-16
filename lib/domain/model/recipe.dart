import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_app/domain/model/ingredients.dart';
import 'package:recipe_app/domain/model/media.dart';
import 'package:recipe_app/domain/model/review.dart';

import 'package:recipe_app/data/util/category_enum.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory Recipe({
    @Default(Categories.all) final Categories category,
    @JsonKey(name: 'id') @Default(0) final int recipeId,
    @JsonKey(name: 'name') @Default('') final String title,
    @JsonKey(name: 'image') @Default('') final String imageUrl,
    @Default('') final String chef,
    @JsonKey(name: 'time') @Default('') final String cookingTime,
    @Default(0) final double rating,
    @Default([Ingredients()]) final List<Ingredients> ingredients,
    @Default(Review()) final Review review,
    @Default(null) final DateTime? createdAt,
    @Default(Media()) final Media media,
    @Default([]) final List<String> recipeStep,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
