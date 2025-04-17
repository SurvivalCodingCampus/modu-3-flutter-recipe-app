// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipeDto _$RecipeDtoFromJson(Map<String, dynamic> json) => _RecipeDto(
  id: (json['id'] as num?)?.toInt(),
  category: json['category'] as String?,
  name: json['name'] as String?,
  image: json['image'] as String?,
  chef: json['chef'] as String?,
  time: json['time'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  bookmarkStatus: json['bookmarkStatus'] as bool?,
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientAmountDto.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RecipeDtoToJson(_RecipeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'image': instance.image,
      'chef': instance.chef,
      'time': instance.time,
      'rating': instance.rating,
      'bookmarkStatus': instance.bookmarkStatus,
      'ingredients': instance.ingredients,
    };
