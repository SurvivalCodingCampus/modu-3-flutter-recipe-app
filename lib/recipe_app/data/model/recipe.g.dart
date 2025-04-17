// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  category: json['category'] as String,
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  chef: json['chef'] as String,
  rate: (json['rate'] as num).toDouble(),
  time: (json['time'] as num).toInt(),
  image: json['image'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
  bookMarked: json['bookMarked'] as bool,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'category': instance.category,
  'id': instance.id,
  'name': instance.name,
  'chef': instance.chef,
  'rate': instance.rate,
  'time': instance.time,
  'image': instance.image,
  'ingredients': instance.ingredients,
  'bookMarked': instance.bookMarked,
};
