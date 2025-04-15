import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_app/data/dto/ingredients_dto.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDto {
  final String? category;
  final int? id;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final double? rating;
  @JsonKey(name: 'ingredients')
  final List<IngredientsDto>? ingredientsDto;

  RecipeDto(
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredientsDto,
  );

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}
