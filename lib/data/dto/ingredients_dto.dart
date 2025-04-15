import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredient_dto.dart';
part 'ingredients_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class IngredientsDto {
  @JsonKey(name: 'ingredient')
  final IngredientDto? ingredientDto;
  final int? amount;

  IngredientsDto(this.ingredientDto, this.amount);

  factory IngredientsDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsDtoToJson(this);
}
