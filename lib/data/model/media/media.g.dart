// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
  imageId: json['imageId'] as String,
  thumbNailUrl: json['thumbNailUrl'] as String,
  imageUrl: json['imageUrl'] as String,
  recipeVideoUrl: json['recipeVideoUrl'] as String,
);

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
  'imageId': instance.imageId,
  'thumbNailUrl': instance.thumbNailUrl,
  'imageUrl': instance.imageUrl,
  'recipeVideoUrl': instance.recipeVideoUrl,
};
