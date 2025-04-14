import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/dto/ingredients_dto.dart';

import '../enums/category.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDto {
  final Category? category;
  final int? id;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final double? rating;
  final List<IngredientsDto>? ingredients;

  const RecipeDto({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}
