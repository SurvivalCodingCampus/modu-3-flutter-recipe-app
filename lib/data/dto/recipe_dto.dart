import 'package:json_annotation/json_annotation.dart';

part 'recipe_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDto {
  String id;
  String name;
  int estimatedTime;
  bool isFavorite;
  double rate;
  String makeUserName;
  String makeUserImageUrl;
  String? videoUrl;
  String imageUrl;
  String createdAt;
  String category;

  RecipeDto({
    required this.id,
    required this.name,
    required this.estimatedTime,
    required this.isFavorite,
    required this.rate,
    required this.makeUserName,
    required this.makeUserImageUrl,
    this.videoUrl,
    required this.imageUrl,
    required this.createdAt,
    required this.category,
  });

  factory RecipeDto.fromJson(Map<String, dynamic> json) => _$RecipeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDtoToJson(this);
}