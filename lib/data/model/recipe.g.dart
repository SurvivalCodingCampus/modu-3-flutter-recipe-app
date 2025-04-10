// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  recipeId: json['recipeId'] as String? ?? '',
  title: json['title'] as String? ?? '',
  ingridients:
      (json['ingridients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  review:
      json['review'] == null
          ? const Review()
          : Review.fromJson(json['review'] as Map<String, dynamic>),
  user:
      json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  media:
      json['media'] == null
          ? const Media()
          : Media.fromJson(json['media'] as Map<String, dynamic>),
  recipeStep:
      (json['recipeStep'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  cookingTime: json['cookingTime'] as String? ?? '',
  categoryList:
      (json['categoryList'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CategorysEnumMap, e))
          .toList() ??
      const [],
  rate: (json['rate'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'recipeId': instance.recipeId,
  'title': instance.title,
  'ingridients': instance.ingridients,
  'review': instance.review,
  'user': instance.user,
  'createdAt': instance.createdAt?.toIso8601String(),
  'media': instance.media,
  'recipeStep': instance.recipeStep,
  'cookingTime': instance.cookingTime,
  'categoryList':
      instance.categoryList.map((e) => _$CategorysEnumMap[e]!).toList(),
  'rate': instance.rate,
};

const _$CategorysEnumMap = {
  Categorys.all: 'all',
  Categorys.cereal: 'cereal',
  Categorys.vegetables: 'vegetables',
  Categorys.dinner: 'dinner',
  Categorys.chinese: 'chinese',
  Categorys.localDish: 'localDish',
  Categorys.fruit: 'fruit',
  Categorys.breakfast: 'breakfast',
  Categorys.spanish: 'spanish',
  Categorys.lunch: 'lunch',
};
