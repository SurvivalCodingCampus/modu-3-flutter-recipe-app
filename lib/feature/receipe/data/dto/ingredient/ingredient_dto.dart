import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_dto.freezed.dart';
part 'ingredient_dto.g.dart';

@freezed
abstract class IngredientDto with _$IngredientDto {
  const factory IngredientDto({int? id, String? name, String? image}) =
      _IngredientDto;

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);
}
