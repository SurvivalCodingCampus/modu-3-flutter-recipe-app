// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipes_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchRecipesAction {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipesAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipesAction()';
}


}

/// @nodoc
class $SearchRecipesActionCopyWith<$Res>  {
$SearchRecipesActionCopyWith(SearchRecipesAction _, $Res Function(SearchRecipesAction) __);
}


/// @nodoc


class onPageLoadGetData implements SearchRecipesAction {
  const onPageLoadGetData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is onPageLoadGetData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchRecipesAction.onPageLoadGetData()';
}


}




/// @nodoc


class onSearchRecipe implements SearchRecipesAction {
  const onSearchRecipe(this.keyWord);
  

 final  String keyWord;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$onSearchRecipeCopyWith<onSearchRecipe> get copyWith => _$onSearchRecipeCopyWithImpl<onSearchRecipe>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is onSearchRecipe&&(identical(other.keyWord, keyWord) || other.keyWord == keyWord));
}


@override
int get hashCode => Object.hash(runtimeType,keyWord);

@override
String toString() {
  return 'SearchRecipesAction.onSearchRecipe(keyWord: $keyWord)';
}


}

/// @nodoc
abstract mixin class $onSearchRecipeCopyWith<$Res> implements $SearchRecipesActionCopyWith<$Res> {
  factory $onSearchRecipeCopyWith(onSearchRecipe value, $Res Function(onSearchRecipe) _then) = _$onSearchRecipeCopyWithImpl;
@useResult
$Res call({
 String keyWord
});




}
/// @nodoc
class _$onSearchRecipeCopyWithImpl<$Res>
    implements $onSearchRecipeCopyWith<$Res> {
  _$onSearchRecipeCopyWithImpl(this._self, this._then);

  final onSearchRecipe _self;
  final $Res Function(onSearchRecipe) _then;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? keyWord = null,}) {
  return _then(onSearchRecipe(
null == keyWord ? _self.keyWord : keyWord // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class onFilterSearchRecipes implements SearchRecipesAction {
  const onFilterSearchRecipes(final  Map<String, dynamic> searchData): _searchData = searchData;
  

 final  Map<String, dynamic> _searchData;
 Map<String, dynamic> get searchData {
  if (_searchData is EqualUnmodifiableMapView) return _searchData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_searchData);
}


/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$onFilterSearchRecipesCopyWith<onFilterSearchRecipes> get copyWith => _$onFilterSearchRecipesCopyWithImpl<onFilterSearchRecipes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is onFilterSearchRecipes&&const DeepCollectionEquality().equals(other._searchData, _searchData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_searchData));

@override
String toString() {
  return 'SearchRecipesAction.onFilterSearchRecipes(searchData: $searchData)';
}


}

/// @nodoc
abstract mixin class $onFilterSearchRecipesCopyWith<$Res> implements $SearchRecipesActionCopyWith<$Res> {
  factory $onFilterSearchRecipesCopyWith(onFilterSearchRecipes value, $Res Function(onFilterSearchRecipes) _then) = _$onFilterSearchRecipesCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> searchData
});




}
/// @nodoc
class _$onFilterSearchRecipesCopyWithImpl<$Res>
    implements $onFilterSearchRecipesCopyWith<$Res> {
  _$onFilterSearchRecipesCopyWithImpl(this._self, this._then);

  final onFilterSearchRecipes _self;
  final $Res Function(onFilterSearchRecipes) _then;

/// Create a copy of SearchRecipesAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchData = null,}) {
  return _then(onFilterSearchRecipes(
null == searchData ? _self._searchData : searchData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
