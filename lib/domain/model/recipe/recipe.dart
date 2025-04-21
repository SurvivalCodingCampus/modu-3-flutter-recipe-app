import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';


@Freezed(fromJson: true, toJson: true)
abstract class Recipe with _$Recipe {
  factory Recipe({
    required String name,
    required String author,
    required String time,
    required double rating,
    required String image,
  }) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

}
