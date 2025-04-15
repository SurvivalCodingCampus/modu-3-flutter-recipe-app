// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientsDto _$IngredientsDtoFromJson(Map<String, dynamic> json) =>
    IngredientsDto(
      json['ingredient'] == null
          ? null
          : IngredientDto.fromJson(json['ingredient'] as Map<String, dynamic>),
      (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IngredientsDtoToJson(IngredientsDto instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredientDto?.toJson(),
      'amount': instance.amount,
    };
