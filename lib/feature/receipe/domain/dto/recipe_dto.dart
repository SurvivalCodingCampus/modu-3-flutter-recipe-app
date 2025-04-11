import 'package:freezed_annotation/freezed_annotation.dart';

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
    // required List<IngredientWithAmount> ingredients,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
}
