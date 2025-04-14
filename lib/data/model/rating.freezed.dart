// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Rating {

 String get title; String get actionName; void Function(int) get onChange;
/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingCopyWith<Rating> get copyWith => _$RatingCopyWithImpl<Rating>(this as Rating, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rating&&(identical(other.title, title) || other.title == title)&&(identical(other.actionName, actionName) || other.actionName == actionName)&&(identical(other.onChange, onChange) || other.onChange == onChange));
}


@override
int get hashCode => Object.hash(runtimeType,title,actionName,onChange);

@override
String toString() {
  return 'Rating(title: $title, actionName: $actionName, onChange: $onChange)';
}


}

/// @nodoc
abstract mixin class $RatingCopyWith<$Res>  {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) _then) = _$RatingCopyWithImpl;
@useResult
$Res call({
 String title, String actionName, void Function(int) onChange
});




}
/// @nodoc
class _$RatingCopyWithImpl<$Res>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._self, this._then);

  final Rating _self;
  final $Res Function(Rating) _then;

/// Create a copy of Rating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? actionName = null,Object? onChange = null,}) {
  return _then(Rating(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,actionName: null == actionName ? _self.actionName : actionName // ignore: cast_nullable_to_non_nullable
as String,onChange: null == onChange ? _self.onChange : onChange // ignore: cast_nullable_to_non_nullable
as void Function(int),
  ));
}

}


// dart format on
