// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  id: json['id'] as String? ?? '0',
  name: json['name'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  chef: json['chef'] as String? ?? '',
  totalTimeMinutes: json['totalTimeMinutes'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
  time: json['time'] as String? ?? '',
  category: json['category'] as String? ?? '',
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'chef': instance.chef,
  'totalTimeMinutes': instance.totalTimeMinutes,
  'rating': instance.rating,
  'time': instance.time,
  'category': instance.category,
};
