// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_amount_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientAmountDto _$IngredientAmountDtoFromJson(Map<String, dynamic> json) =>
    _IngredientAmountDto(
      ingredient:
          json['ingredient'] == null
              ? null
              : IngredientDto.fromJson(
                json['ingredient'] as Map<String, dynamic>,
              ),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$IngredientAmountDtoToJson(
  _IngredientAmountDto instance,
) => <String, dynamic>{
  'ingredient': instance.ingredient,
  'amount': instance.amount,
};
