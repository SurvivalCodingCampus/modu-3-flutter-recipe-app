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

 int get recipeId; int get reviewId; int get goodCount; int get badCount; DateTime get createdAt; User get user; String get comment;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.reviewId, reviewId) || other.reviewId == reviewId)&&(identical(other.goodCount, goodCount) || other.goodCount == goodCount)&&(identical(other.badCount, badCount) || other.badCount == badCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,reviewId,goodCount,badCount,createdAt,user,comment);

@override
String toString() {
  return 'Review(recipeId: $recipeId, reviewId: $reviewId, goodCount: $goodCount, badCount: $badCount, createdAt: $createdAt, user: $user, comment: $comment)';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 int recipeId, int reviewId, int goodCount, int badCount, DateTime createdAt, User user, String comment
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
@pragma('vm:prefer-inline') @override $Res call({Object? recipeId = null,Object? reviewId = null,Object? goodCount = null,Object? badCount = null,Object? createdAt = null,Object? user = null,Object? comment = null,}) {
  return _then(Review(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as int,reviewId: null == reviewId ? _self.reviewId : reviewId // ignore: cast_nullable_to_non_nullable
as int,goodCount: null == goodCount ? _self.goodCount : goodCount // ignore: cast_nullable_to_non_nullable
as int,badCount: null == badCount ? _self.badCount : badCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
