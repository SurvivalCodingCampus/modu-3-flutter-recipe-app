// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecipesDto _$RecipesDtoFromJson(Map<String, dynamic> json) => _RecipesDto(
  recipes:
      (json['recipes'] as List<dynamic>?)
          ?.map((e) => Recipes.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RecipesDtoToJson(_RecipesDto instance) =>
    <String, dynamic>{'recipes': instance.recipes};

_Recipes _$RecipesFromJson(Map<String, dynamic> json) => _Recipes(
  category: json['category'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  chef: json['chef'] as String?,
  time: json['time'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RecipesToJson(_Recipes instance) => <String, dynamic>{
  'category': instance.category,
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'chef': instance.chef,
  'time': instance.time,
  'rating': instance.rating,
  'ingredients': instance.ingredients,
};

_Ingredients _$IngredientsFromJson(Map<String, dynamic> json) => _Ingredients(
  ingredient:
      json['ingredient'] == null
          ? null
          : Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
  amount: (json['amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$IngredientsToJson(_Ingredients instance) =>
    <String, dynamic>{
      'ingredient': instance.ingredient,
      'amount': instance.amount,
    };

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
