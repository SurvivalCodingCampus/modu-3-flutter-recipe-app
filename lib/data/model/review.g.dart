// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  recipeId: json['recipeId'] as String? ?? '',
  reviewId: json['reviewId'] as String? ?? '',
  goodCount: (json['goodCount'] as num?)?.toInt() ?? 0,
  badCount: (json['badCount'] as num?)?.toInt() ?? 0,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  userId: json['userId'] as String? ?? '',
  comment: json['comment'] as String? ?? '',
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'recipeId': instance.recipeId,
  'reviewId': instance.reviewId,
  'goodCount': instance.goodCount,
  'badCount': instance.badCount,
  'createdAt': instance.createdAt?.toIso8601String(),
  'userId': instance.userId,
  'comment': instance.comment,
};
