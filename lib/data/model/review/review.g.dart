// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  recipeId: (json['recipeId'] as num).toInt(),
  reviewId: (json['reviewId'] as num).toInt(),
  goodCount: (json['goodCount'] as num).toInt(),
  badCount: (json['badCount'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  comment: json['comment'] as String,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'recipeId': instance.recipeId,
  'reviewId': instance.reviewId,
  'goodCount': instance.goodCount,
  'badCount': instance.badCount,
  'createdAt': instance.createdAt.toIso8601String(),
  'user': instance.user.toJson(),
  'comment': instance.comment,
};
