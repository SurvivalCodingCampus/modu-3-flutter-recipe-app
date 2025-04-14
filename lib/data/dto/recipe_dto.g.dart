// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDto _$RecipeDtoFromJson(Map<String, dynamic> json) => RecipeDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$RecipeDtoToJson(RecipeDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'address': instance.address,
};
