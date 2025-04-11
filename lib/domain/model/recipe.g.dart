// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String,
  chef: json['chef'] as String,
  totalTimeMinutes: json['totalTimeMinutes'] as String,
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'chef': instance.chef,
  'totalTimeMinutes': instance.totalTimeMinutes,
  'rating': instance.rating,
};
