import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/dto/dto.dart';
import 'package:recipe_app/domain/model/ingredient.dart';

part 'recipe_dto.g.dart';

@JsonSerializable()
class RecipeDto {
  final String? category;
  final num? id;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final num? rating;
  final List<IngredientDto>? ingredients;

  const RecipeDto({
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}
