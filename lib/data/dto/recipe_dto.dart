import 'package:json_annotation/json_annotation.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDTO {
  int? id;
  String? category;
  String? name;

  @JsonKey(name: 'image')
  String? imageUrl;
  double? rating;

  @JsonKey(name: 'time')
  String? cookTime;

  @JsonKey(name: 'ingredients')
  List<Map<String, dynamic>> ingredients;

  RecipeDTO({
    required this.id,
    required this.category,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.cookTime,
    required this.ingredients,
  });

  factory RecipeDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDTOToJson(this);
}
