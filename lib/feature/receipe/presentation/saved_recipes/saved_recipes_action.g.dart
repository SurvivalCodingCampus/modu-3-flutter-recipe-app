// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipes_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchRecipes _$FetchRecipesFromJson(Map<String, dynamic> json) =>
    FetchRecipes($type: json['runtimeType'] as String?);

Map<String, dynamic> _$FetchRecipesToJson(FetchRecipes instance) =>
    <String, dynamic>{'runtimeType': instance.$type};

BookmarkRecipe _$BookmarkRecipeFromJson(Map<String, dynamic> json) =>
    BookmarkRecipe(
      (json['id'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$BookmarkRecipeToJson(BookmarkRecipe instance) =>
    <String, dynamic>{'id': instance.id, 'runtimeType': instance.$type};
