import 'package:recipe_app/data/dto/dto.dart';

class RecipeDto {
  final String? category;
  final num? id;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final num? rating;
  final List<RecipeIngredientDto>? ingredients;

  RecipeDto({
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });
}
