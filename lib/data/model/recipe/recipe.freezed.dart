// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {

 int get recipeId; String get title; List<Ingredient> get ingredient; int get time; double get rating; String get userName; String get thumbNailUrl; User? get user; Media? get media; DateTime get createdAt; Category get category;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.ingredient, ingredient)&&(identical(other.time, time) || other.time == time)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.thumbNailUrl, thumbNailUrl) || other.thumbNailUrl == thumbNailUrl)&&(identical(other.user, user) || other.user == user)&&(identical(other.media, media) || other.media == media)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,title,const DeepCollectionEquality().hash(ingredient),time,rating,userName,thumbNailUrl,user,media,createdAt,category);

@override
String toString() {
  return 'Recipe(recipeId: $recipeId, title: $title, ingredient: $ingredient, time: $time, rating: $rating, userName: $userName, thumbNailUrl: $thumbNailUrl, user: $user, media: $media, createdAt: $createdAt, category: $category)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String userName, int recipeId, DateTime createdAt, String title, List<Ingredient> ingredient, int time, double rating, String thumbNailUrl, Category category, User? user, Media? media
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = null,Object? recipeId = null,Object? createdAt = null,Object? title = null,Object? ingredient = null,Object? time = null,Object? rating = null,Object? thumbNailUrl = null,Object? category = null,Object? user = freezed,Object? media = freezed,}) {
  return _then(Recipe(
userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingredient: null == ingredient ? _self.ingredient : ingredient // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,thumbNailUrl: null == thumbNailUrl ? _self.thumbNailUrl : thumbNailUrl // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media?,
  ));
}

}


// dart format on
