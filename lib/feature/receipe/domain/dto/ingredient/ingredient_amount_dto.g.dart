// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_amount_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientAmountDto _$IngredientAmountDtoFromJson(Map<String, dynamic> json) =>
    _IngredientAmountDto(
      ingredients:
          json['ingredients'] == null
              ? null
              : IngredientDto.fromJson(
                json['ingredients'] as Map<String, dynamic>,
              ),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IngredientAmountDtoToJson(
  _IngredientAmountDto instance,
) => <String, dynamic>{
  'ingredients': instance.ingredients,
  'amount': instance.amount,
};
