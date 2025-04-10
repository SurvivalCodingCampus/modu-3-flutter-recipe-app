// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  weight: (json['weight'] as num?)?.toInt() ?? 0,
  imageUrl: json['imageUrl'] as String? ?? '',
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'imageUrl': instance.imageUrl,
    };
