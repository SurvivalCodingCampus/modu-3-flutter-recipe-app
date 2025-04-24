// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  name: json['name'] as String,
  author: json['author'] as String,
  time: json['time'] as String,
  rating: (json['rating'] as num).toDouble(),
  image: json['image'] as String,
  category: json['category'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'name': instance.name,
  'author': instance.author,
  'time': instance.time,
  'rating': instance.rating,
  'image': instance.image,
  'category': instance.category,
  'ingredients': instance.ingredients,
};
