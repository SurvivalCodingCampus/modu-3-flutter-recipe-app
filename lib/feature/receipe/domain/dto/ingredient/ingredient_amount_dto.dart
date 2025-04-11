import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/feature/receipe/domain/dto/ingredient/ingredient_dto.dart';

part 'ingredient_amount_dto.freezed.dart';
part 'ingredient_amount_dto.g.dart';

@freezed
abstract class IngredientAmountDto with _$IngredientAmountDto {
  const factory IngredientAmountDto({IngredientDto? ingredient, int? amount}) =
      _IngredientAmountDto;

  factory IngredientAmountDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientAmountDtoFromJson(json);
}
