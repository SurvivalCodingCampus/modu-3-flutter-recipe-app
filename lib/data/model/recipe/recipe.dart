// [Recipe] 레시피 게시글의 기본 정보를 담고 있습니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/data/model/filter/filter_enum.dart';
import 'package:recipe_app/data/model/ingredient/ingredient.dart';
import 'package:recipe_app/data/model/media/media.dart';
import 'package:recipe_app/data/model/user/user.dart';

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
  final User? user;
  final Media? media;
  final DateTime createdAt;
  final Category category;
  // final List<Category> categoryList;
  // final List<Review> reviews;
  // final List<Procedure> procedures;

  const Recipe({
    required this.userName,
    required this.recipeId,
    required this.createdAt,
    required this.title,
    required this.ingredient,
    required this.time,
    required this.rating,
    required this.thumbNailUrl,
    required this.category,
    this.user,
    this.media,
    // recipeId this.procedures,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
