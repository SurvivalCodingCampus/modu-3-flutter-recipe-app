import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes_dto.freezed.dart';
part 'recipes_dto.g.dart';

@freezed
abstract class RecipesDto with _$RecipesDto {
  const factory RecipesDto({
    @JsonKey(name: 'recipes') List<Recipes>? recipes,
  }) = _RecipesDto;

  factory RecipesDto.fromJson(Map<String, Object?> json) => _$RecipesDtoFromJson(json);
}

@freezed
abstract class Recipes with _$Recipes {
  const factory Recipes({
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'chef') String? chef,
    @JsonKey(name: 'time') String? time,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'ingredients') List<Ingredients>? ingredients,
  }) = _Recipes;

  factory Recipes.fromJson(Map<String, Object?> json) => _$RecipesFromJson(json);
}

@freezed
abstract class Ingredients with _$Ingredients {
  const factory Ingredients({
    @JsonKey(name: 'ingredient') Ingredient? ingredient,
    @JsonKey(name: 'amount') int? amount,
  }) = _Ingredients;

  factory Ingredients.fromJson(Map<String, Object?> json) => _$IngredientsFromJson(json);
}

@freezed
abstract class Ingredient with _$Ingredient {
  const factory Ingredient({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image') String? image,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, Object?> json) => _$IngredientFromJson(json);
}

