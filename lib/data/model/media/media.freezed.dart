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

 String get imageId; String get thumbNailUrl; String get imageUrl; String get recipeVideoUrl;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.thumbNailUrl, thumbNailUrl) || other.thumbNailUrl == thumbNailUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.recipeVideoUrl, recipeVideoUrl) || other.recipeVideoUrl == recipeVideoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageId,thumbNailUrl,imageUrl,recipeVideoUrl);

@override
String toString() {
  return 'Media(imageId: $imageId, thumbNailUrl: $thumbNailUrl, imageUrl: $imageUrl, recipeVideoUrl: $recipeVideoUrl)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 String imageId, String thumbNailUrl, String imageUrl, String recipeVideoUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? imageId = null,Object? thumbNailUrl = null,Object? imageUrl = null,Object? recipeVideoUrl = null,}) {
  return _then(Media(
imageId: null == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as String,thumbNailUrl: null == thumbNailUrl ? _self.thumbNailUrl : thumbNailUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,recipeVideoUrl: null == recipeVideoUrl ? _self.recipeVideoUrl : recipeVideoUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
