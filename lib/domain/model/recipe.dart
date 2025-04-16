import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
@JsonSerializable()
class Recipe with _$Recipe {
  @override
  final String id;

  @override
  final String name;

  @override
  final String imageUrl;

  @override
  final String chef;

  @override
  final String totalTimeMinutes;

  @override
  final double rating;
  @override
  final String time;
  @override
  final String category;
  final bool isFavorite;

  const Recipe({
    this.id = '0',
    this.name = '',
    this.imageUrl = '',
    this.chef = '',
    this.totalTimeMinutes = '',
    this.rating = 0.0,
    this.time = '',
    this.category = '',
    this.isFavorite = false,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
