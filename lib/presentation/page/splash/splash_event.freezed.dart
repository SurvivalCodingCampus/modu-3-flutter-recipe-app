// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashEvent<T> {

 String get message;
/// Create a copy of SplashEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashEventCopyWith<T, SplashEvent<T>> get copyWith => _$SplashEventCopyWithImpl<T, SplashEvent<T>>(this as SplashEvent<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEvent<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashEvent<$T>(message: $message)';
}


}

/// @nodoc
abstract mixin class $SplashEventCopyWith<T,$Res>  {
  factory $SplashEventCopyWith(SplashEvent<T> value, $Res Function(SplashEvent<T>) _then) = _$SplashEventCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SplashEventCopyWithImpl<T,$Res>
    implements $SplashEventCopyWith<T, $Res> {
  _$SplashEventCopyWithImpl(this._self, this._then);

  final SplashEvent<T> _self;
  final $Res Function(SplashEvent<T>) _then;

/// Create a copy of SplashEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class ShowErrorMessage<T> implements SplashEvent<T> {
  const ShowErrorMessage(this.message);
  

@override final  String message;

/// Create a copy of SplashEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowErrorMessageCopyWith<T, ShowErrorMessage<T>> get copyWith => _$ShowErrorMessageCopyWithImpl<T, ShowErrorMessage<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowErrorMessage<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashEvent<$T>.showErrorMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowErrorMessageCopyWith<T,$Res> implements $SplashEventCopyWith<T, $Res> {
  factory $ShowErrorMessageCopyWith(ShowErrorMessage<T> value, $Res Function(ShowErrorMessage<T>) _then) = _$ShowErrorMessageCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShowErrorMessageCopyWithImpl<T,$Res>
    implements $ShowErrorMessageCopyWith<T, $Res> {
  _$ShowErrorMessageCopyWithImpl(this._self, this._then);

  final ShowErrorMessage<T> _self;
  final $Res Function(ShowErrorMessage<T>) _then;

/// Create a copy of SplashEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowErrorMessage<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
