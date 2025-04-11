import 'package:recipe_app/dto/ingredients_dto.dart';
import 'package:recipe_app/dto/pictures_dto.dart';

class RecipeDto {
  final String? category;
  final num? id;
  final String? title;
  final PicturesDto? picture;
  final String? chef;
  final String? time;
  final num? rating;
  final List<IngredientsDto>? ingredients;

  RecipeDto({
    this.category,
    this.id,
    this.title,
    this.picture,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      category: json['category'] as String?,
      id: json['id'] as num?,
      title: json['title'] as String?,
      picture:
          json['picture'] != null
              ? PicturesDto.fromJson(json['picture'])
              : null,
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
