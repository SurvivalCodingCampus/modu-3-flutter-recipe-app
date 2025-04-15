// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDto _$RecipeDtoFromJson(Map<String, dynamic> json) => RecipeDto(
  json['category'] as String?,
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  json['image'] as String?,
  json['chef'] as String?,
  json['time'] as String?,
  (json['rating'] as num?)?.toDouble(),
  (json['ingredients'] as List<dynamic>?)
      ?.map((e) => IngredientsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipeDtoToJson(RecipeDto instance) => <String, dynamic>{
  'category': instance.category,
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'chef': instance.chef,
  'time': instance.time,
  'rating': instance.rating,
  'ingredients': instance.ingredientsDto?.map((e) => e.toJson()).toList(),
};
