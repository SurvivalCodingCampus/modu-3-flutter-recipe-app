// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Review {

 String get recipeId; String get reviewId; int get goodCount; int get badCount; DateTime? get createdAt; String get userId; String get comment;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount)&&(identical(other.badCount, badCount) || other.badCount == badCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,reviewId,goodCount,badCount,createdAt,userId,comment);

@override
String toString() {
  return 'Review(recipeId: $recipeId, reviewId: $reviewId, goodCount: $goodCount, badCount: $badCount, createdAt: $createdAt, userId: $userId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 String recipeId, String reviewId, int goodCount, int badCount, DateTime? createdAt, String userId, String comment
});




}
/// @nodoc
class _$ReviewCopyWithImpl<$Res>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipeId = null,Object? reviewId = null,Object? goodCount = null,Object? badCount = null,Object? createdAt = freezed,Object? userId = null,Object? comment = null,}) {
  return _then(_self.copyWith(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,goodCount: null == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int,badCount: null == badCount ? _self.badCount : badCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Review implements Review {
  const _Review({this.recipeId = '', this.reviewId = '', this.goodCount = 0, this.badCount = 0, this.createdAt = null, this.userId = '', this.comment = ''});
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

@override@JsonKey() final  String recipeId;
@override@JsonKey() final  String reviewId;
@override@JsonKey() final  int goodCount;
@override@JsonKey() final  int badCount;
@override@JsonKey() final  DateTime? createdAt;
@override@JsonKey() final  String userId;
@override@JsonKey() final  String comment;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount)&&(identical(other.badCount, badCount) || other.badCount == badCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,reviewId,goodCount,badCount,createdAt,userId,comment);

@override
String toString() {
  return 'Review(recipeId: $recipeId, reviewId: $reviewId, goodCount: $goodCount, badCount: $badCount, createdAt: $createdAt, userId: $userId, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@override @useResult
$Res call({
 String recipeId, String reviewId, int goodCount, int badCount, DateTime? createdAt, String userId, String comment
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipeId = null,Object? reviewId = null,Object? goodCount = null,Object? badCount = null,Object? createdAt = freezed,Object? userId = null,Object? comment = null,}) {
  return _then(_Review(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as String,goodCount: null == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int,badCount: null == badCount ? _self.badCount : badCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
