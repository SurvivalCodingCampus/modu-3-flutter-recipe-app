// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Media {

 String get imageId; String get thunbNailUrl; String get imageUrl; String get recipeVideoUrl;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.thunbNailUrl, thunbNailUrl) || other.thunbNailUrl == thunbNailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.recipeVideoUrl, recipeVideoUrl) || other.recipeVideoUrl == recipeVideoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageId,thunbNailUrl,imageUrl,recipeVideoUrl);

@override
String toString() {
  return 'Media(imageId: $imageId, thunbNailUrl: $thunbNailUrl, imageUrl: $imageUrl, recipeVideoUrl: $recipeVideoUrl)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 String imageId, String thunbNailUrl, String imageUrl, String recipeVideoUrl
});




}
/// @nodoc
class _$MediaCopyWithImpl<$Res>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageId = null,Object? thunbNailUrl = null,Object? imageUrl = null,Object? recipeVideoUrl = null,}) {
  return _then(_self.copyWith(
imageId: null == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String,thunbNailUrl: null == thunbNailUrl ? _self.thunbNailUrl : thunbNailUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,recipeVideoUrl: null == recipeVideoUrl ? _self.recipeVideoUrl : recipeVideoUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Media implements Media {
  const _Media({this.imageId = '', this.thunbNailUrl = '', this.imageUrl = '', this.recipeVideoUrl = ''});
  factory _Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

@override@JsonKey() final  String imageId;
@override@JsonKey() final  String thunbNailUrl;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  String recipeVideoUrl;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaCopyWith<_Media> get copyWith => __$MediaCopyWithImpl<_Media>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Media&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.thunbNailUrl, thunbNailUrl) || other.thunbNailUrl == thunbNailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.recipeVideoUrl, recipeVideoUrl) || other.recipeVideoUrl == recipeVideoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageId,thunbNailUrl,imageUrl,recipeVideoUrl);

@override
String toString() {
  return 'Media(imageId: $imageId, thunbNailUrl: $thunbNailUrl, imageUrl: $imageUrl, recipeVideoUrl: $recipeVideoUrl)';
}


}

/// @nodoc
abstract mixin class _$MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$MediaCopyWith(_Media value, $Res Function(_Media) _then) = __$MediaCopyWithImpl;
@override @useResult
$Res call({
 String imageId, String thunbNailUrl, String imageUrl, String recipeVideoUrl
});




}
/// @nodoc
class __$MediaCopyWithImpl<$Res>
    implements _$MediaCopyWith<$Res> {
  __$MediaCopyWithImpl(this._self, this._then);

  final _Media _self;
  final $Res Function(_Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageId = null,Object? thunbNailUrl = null,Object? imageUrl = null,Object? recipeVideoUrl = null,}) {
  return _then(_Media(
imageId: null == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String,thunbNailUrl: null == thunbNailUrl ? _self.thunbNailUrl : thunbNailUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,recipeVideoUrl: null == recipeVideoUrl ? _self.recipeVideoUrl : recipeVideoUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
