// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: (json['id'] as num).toInt(),
  category: json['category'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  chef: json['chef'] as String,
  time: json['time'] as String,
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'name': instance.name,
  'image': instance.image,
  'chef': instance.chef,
  'time': instance.time,
  'rating': instance.rating,
};
