import 'package:recipe_app/dto/ingredients_dto.dart';
import 'package:recipe_app/dto/picture_dto.dart';

class RecipeDto {}

class Recipe {
  final String? category;
  final num? id;
  final String? title;
  final Picture? picture;
  final String? chef;
  final String? time;
  final num? rating;
  final List<IngredientsDto>? ingredients;

  Recipe({
    this.category,
    this.id,
    this.title,
    this.picture,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      category: json['category'] as String?,
      id: json['id'] as num?,
      title: json['title'] as String?,
      picture:
          json['picture'] != null ? Picture.fromJson(json['picture']) : null,
      chef: json['chef'] as String?,
      time: json['time']?.toString(),
      rating: json['rating'] as num?,
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((e) => IngredientsDto.fromJson(e))
              .toList(),
    );
  }
}
