import 'package:json_annotation/json_annotation.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDto {
  final String? category;
  final num? id;
  final String? name;
  final String? image;
  final String? chef;
  final num? time;
  final num? rating;
  final bool? bookMarked;
  final List<Map<String, dynamic>>? ingredients;

  RecipeDto(
    this.category,
    this.id,
    this.name,
    this.image,
    this.chef,
    this.time,
    this.rating,
    this.ingredients,
    this.bookMarked,
  );

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}
