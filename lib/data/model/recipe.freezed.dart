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

 String get recipeId; String get title; List<Ingredient> get ingridients; Review get review; User get user; DateTime? get createdAt; Media get media; List<String> get recipeStep; String get cookingTime; List<Categorys> get categoryList; double get rate;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.ingridients, ingridients)&&(identical(other.review, review) || other.review == review)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.media, media) || other.media == media)&&const DeepCollectionEquality().equals(other.recipeStep, recipeStep)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&const DeepCollectionEquality().equals(other.categoryList, categoryList)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,title,const DeepCollectionEquality().hash(ingridients),review,user,createdAt,media,const DeepCollectionEquality().hash(recipeStep),cookingTime,const DeepCollectionEquality().hash(categoryList),rate);

@override
String toString() {
  return 'Recipe(recipeId: $recipeId, title: $title, ingridients: $ingridients, review: $review, user: $user, createdAt: $createdAt, media: $media, recipeStep: $recipeStep, cookingTime: $cookingTime, categoryList: $categoryList, rate: $rate)';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String recipeId, String title, List<Ingredient> ingridients, Review review, User user, DateTime? createdAt, Media media, List<String> recipeStep, String cookingTime, List<Categorys> categoryList, double rate
});


$ReviewCopyWith<$Res> get review;$UserCopyWith<$Res> get user;$MediaCopyWith<$Res> get media;

}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipeId = null,Object? title = null,Object? ingridients = null,Object? review = null,Object? user = null,Object? createdAt = freezed,Object? media = null,Object? recipeStep = null,Object? cookingTime = null,Object? categoryList = null,Object? rate = null,}) {
  return _then(_self.copyWith(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingridients: null == ingridients ? _self.ingridients : ingridients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as Review,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,recipeStep: null == recipeStep ? _self.recipeStep : recipeStep // ignore: cast_nullable_to_non_nullable
as List<String>,cookingTime: null == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as String,categoryList: null == categoryList ? _self.categoryList : categoryList // ignore: cast_nullable_to_non_nullable
as List<Categorys>,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewCopyWith<$Res> get review {
  
  return $ReviewCopyWith<$Res>(_self.review, (value) {
    return _then(_self.copyWith(review: value));
  });
}/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({this.recipeId = '', this.title = '', final  List<Ingredient> ingridients = const [], this.review = const Review(), this.user = const User(), this.createdAt = null, this.media = const Media(), final  List<String> recipeStep = const [], this.cookingTime = '', final  List<Categorys> categoryList = const [], this.rate = 0}): _ingridients = ingridients,_recipeStep = recipeStep,_categoryList = categoryList;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override@JsonKey() final  String recipeId;
@override@JsonKey() final  String title;
 final  List<Ingredient> _ingridients;
@override@JsonKey() List<Ingredient> get ingridients {
  if (_ingridients is EqualUnmodifiableListView) return _ingridients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingridients);
}

@override@JsonKey() final  Review review;
@override@JsonKey() final  User user;
@override@JsonKey() final  DateTime? createdAt;
@override@JsonKey() final  Media media;
 final  List<String> _recipeStep;
@override@JsonKey() List<String> get recipeStep {
  if (_recipeStep is EqualUnmodifiableListView) return _recipeStep;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipeStep);
}

@override@JsonKey() final  String cookingTime;
 final  List<Categorys> _categoryList;
@override@JsonKey() List<Categorys> get categoryList {
  if (_categoryList is EqualUnmodifiableListView) return _categoryList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryList);
}

@override@JsonKey() final  double rate;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._ingridients, _ingridients)&&(identical(other.review, review) || other.review == review)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.media, media) || other.media == media)&&const DeepCollectionEquality().equals(other._recipeStep, _recipeStep)&&(identical(other.cookingTime, cookingTime) || other.cookingTime == cookingTime)&&const DeepCollectionEquality().equals(other._categoryList, _categoryList)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,title,const DeepCollectionEquality().hash(_ingridients),review,user,createdAt,media,const DeepCollectionEquality().hash(_recipeStep),cookingTime,const DeepCollectionEquality().hash(_categoryList),rate);

@override
String toString() {
  return 'Recipe(recipeId: $recipeId, title: $title, ingridients: $ingridients, review: $review, user: $user, createdAt: $createdAt, media: $media, recipeStep: $recipeStep, cookingTime: $cookingTime, categoryList: $categoryList, rate: $rate)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String recipeId, String title, List<Ingredient> ingridients, Review review, User user, DateTime? createdAt, Media media, List<String> recipeStep, String cookingTime, List<Categorys> categoryList, double rate
});


@override $ReviewCopyWith<$Res> get review;@override $UserCopyWith<$Res> get user;@override $MediaCopyWith<$Res> get media;

}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipeId = null,Object? title = null,Object? ingridients = null,Object? review = null,Object? user = null,Object? createdAt = freezed,Object? media = null,Object? recipeStep = null,Object? cookingTime = null,Object? categoryList = null,Object? rate = null,}) {
  return _then(_Recipe(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,ingridients: null == ingridients ? _self._ingridients : ingridients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,review: null == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as Review,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,recipeStep: null == recipeStep ? _self._recipeStep : recipeStep // ignore: cast_nullable_to_non_nullable
as List<String>,cookingTime: null == cookingTime ? _self.cookingTime : cookingTime // ignore: cast_nullable_to_non_nullable
as String,categoryList: null == categoryList ? _self._categoryList : categoryList // ignore: cast_nullable_to_non_nullable
as List<Categorys>,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewCopyWith<$Res> get review {
  
  return $ReviewCopyWith<$Res>(_self.review, (value) {
    return _then(_self.copyWith(review: value));
  });
}/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}
}

// dart format on
