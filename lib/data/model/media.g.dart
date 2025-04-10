// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Media _$MediaFromJson(Map<String, dynamic> json) => _Media(
  imageId: json['imageId'] as String? ?? '',
  thunbNailUrl: json['thunbNailUrl'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  recipeVideoUrl: json['recipeVideoUrl'] as String? ?? '',
);

Map<String, dynamic> _$MediaToJson(_Media instance) => <String, dynamic>{
  'imageId': instance.imageId,
  'thunbNailUrl': instance.thunbNailUrl,
  'imageUrl': instance.imageUrl,
  'recipeVideoUrl': instance.recipeVideoUrl,
};
