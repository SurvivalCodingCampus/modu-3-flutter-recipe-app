import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipe_app/feature/receipe/data/dto/ingredient/ingredient_amount_dto.dart';

part 'recipe_dto.freezed.dart';
part 'recipe_dto.g.dart';

@freezed
abstract class RecipeDto with _$RecipeDto {
  const factory RecipeDto({
    int? id,
    String? category,
    String? name,
    String? image,
    String? chef,
    String? time,
    double? rating,
    List<IngredientAmountDto>? ingredients,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
}
