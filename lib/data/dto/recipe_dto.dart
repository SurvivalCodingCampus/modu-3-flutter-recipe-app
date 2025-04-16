import 'package:json_annotation/json_annotation.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDTO {
  int? id;
  String? category;
  String? name;
  String? chef;

  @JsonKey(name: 'image')
  String? imageUrl;
  double? rating;

  @JsonKey(name: 'time')
  String? cookTime;

  @JsonKey(name: 'ingredients')
  List<Map<String, dynamic>>? ingredients;

  bool? bookmarked;

  RecipeDTO({
    this.id,
    this.category,
    this.name,
    this.imageUrl,
    this.chef,
    this.bookmarked,
    this.rating,
    this.cookTime,
    this.ingredients,
  });

  factory RecipeDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDTOToJson(this);
}
