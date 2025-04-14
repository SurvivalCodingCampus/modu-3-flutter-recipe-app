import 'package:recipe_app/data/dto/ingredient_with_amount_dto.dart';

class RecipeDto {
  num? id;
  String? category;
  String? name;
  String? time;
  String? chef;
  num? rating;
  String? image;
  List<IngredientWithAmountDto>? ingredients;

  RecipeDto({
    this.id,
    this.category,
    this.name,
    this.time,
    this.chef,
    this.rating,
    this.image,
    this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      id: json['id'] as num?,
      category: json['category'] as String?,
      name: json['name'] as String?,
      time: json['time'] as String?,
      chef: json['chef'] as String?,
      rating: json['rating'] as num?,
      image: json['image'] as String?,
      ingredients:
          (json['ingredients'] as List<dynamic>?)
              ?.map((e) => IngredientWithAmountDto.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'name': name,
    'time': time,
    'chef': chef,
    'rating': rating,
    'image': image,
    'ingredients': ingredients?.map((e) => e.toJson()).toList(),
  };
}
