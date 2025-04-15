// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
  userName: json['userName'] as String,
  recipeId: (json['recipeId'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  title: json['title'] as String,
  ingredient:
      (json['ingredient'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
  time: (json['time'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
  thumbNailUrl: json['thumbNailUrl'] as String,
  category: $enumDecode(_$CategoryEnumMap, json['category']),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  media:
      json['media'] == null
          ? null
          : Media.fromJson(json['media'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
  'recipeId': instance.recipeId,
  'title': instance.title,
  'ingredient': instance.ingredient.map((e) => e.toJson()).toList(),
  'time': instance.time,
  'rating': instance.rating,
  'userName': instance.userName,
  'thumbNailUrl': instance.thumbNailUrl,
  'user': instance.user?.toJson(),
  'media': instance.media?.toJson(),
  'createdAt': instance.createdAt.toIso8601String(),
  'category': _$CategoryEnumMap[instance.category]!,
};

const _$CategoryEnumMap = {
  Category.all: 'all',
  Category.cereal: 'cereal',
  Category.vegetables: 'vegetables',
  Category.dinner: 'dinner',
  Category.chinese: 'chinese',
  Category.localDish: 'localDish',
  Category.fruit: 'fruit',
  Category.breakfast: 'breakfast',
  Category.spanish: 'spanish',
  Category.lunch: 'lunch',
};
