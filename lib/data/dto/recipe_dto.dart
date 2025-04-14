import 'ingredient_item_dto.dart';

class RecipeDto {
  final int? id;
  final String? category;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final double? rating;
  final List<RecipeIngredientDto>? ingredients;

  RecipeDto({
    this.id,
    this.category,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    var ingredientList = json['ingredients'] as List?;
    List<RecipeIngredientDto> ingredients =
        ingredientList != null
            ? ingredientList
                .map((ingredient) => RecipeIngredientDto.fromJson(ingredient))
                .toList()
            : [];

    return RecipeDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
      chef: json['chef'] as String?,
      time: json['time'] as String?,
      rating:
          (json['rating'] is num)
              ? (json['rating'] as num).toDouble()
              : null, // num 타입 검사
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'name': name,
    'image': image,
    'chef': chef,
    'time': time,
    'rating': rating,
    'ingredients':
        ingredients?.map((e) => e.toJson()).toList(), // null 체크 및 toJson 호출
  };
}
