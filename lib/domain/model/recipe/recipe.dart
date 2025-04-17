// [Recipe] 레시피 게시글의 기본 정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/domain/model/ingredient/ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Recipe with _$Recipe {
  final int recipeId;
  final String title;
  final List<Ingredient> ingredient;
  final int time;
  final double rating;
  final String userName;
  final String thumbNailUrl;
  final DateTime createdAt;
  final Category category;
  final bool isBookmarked;
  // final List<Category> categoryList;
  // final List<Review> reviews;

  const Recipe({
    required this.recipeId,
    required this.title,
    required this.ingredient,
    required this.time,
    required this.rating,
    required this.userName,
    required this.thumbNailUrl,
    required this.createdAt,
    required this.category,
    this.isBookmarked = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
