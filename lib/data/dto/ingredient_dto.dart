import 'package:json_annotation/json_annotation.dart';

part 'ingredient_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientDTO {
  int? id;
  String? name;

  @JsonKey(name: 'image')
  String? imageUrl;

  IngredientDTO({this.id, this.name, this.imageUrl});

  factory IngredientDTO.fromJson(Map<String, dynamic> json) =>
      _$IngredientDTOFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientDTOToJson(this);
}
