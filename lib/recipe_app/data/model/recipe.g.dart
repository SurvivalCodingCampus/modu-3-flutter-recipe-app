// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  title: json['title'] as String,
  chef: json['chef'] as String,
  rate: (json['rate'] as num).toDouble(),
  minutes: (json['minutes'] as num).toInt(),
  imagePath: json['imagePath'] as String,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'title': instance.title,
  'chef': instance.chef,
  'rate': instance.rate,
  'minutes': instance.minutes,
  'imagePath': instance.imagePath,
};
