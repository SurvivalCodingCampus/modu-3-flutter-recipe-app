import 'package:json_annotation/json_annotation.dart';

part 'recipe_dto.g.dart';

@JsonSerializable()
class RecipeDto {
  final num? id;
  final String? category;
  final String? name;
  final String? image;
  final String? chef;
  final String? time;
  final num? rating; // int 또는 double 모두 수용 가능
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

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}

@JsonSerializable()
class RecipeIngredientDto {
  final IngredientDto? ingredient;
  final num? amount;

  RecipeIngredientDto({this.ingredient, this.amount});

  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeIngredientDtoToJson(this);
}

@JsonSerializable()
class IngredientDto {
  final num? id;
  final String? name;
  final String? image;

  IngredientDto({this.id, this.name, this.image});

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);
}