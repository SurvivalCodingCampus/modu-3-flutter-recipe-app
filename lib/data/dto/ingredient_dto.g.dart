// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) =>
    IngredientDto(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$IngredientDtoToJson(IngredientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
