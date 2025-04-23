// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchRecipesState {

 List<Recipe> get recipes; List<Recipe> get filterRecipes; List<Recipe> get beforeSearchRecipes; String get searchKeyWord; bool get searchState; bool get isSearchLoading;
/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRecipesStateCopyWith<SearchRecipesState> get copyWith => _$SearchRecipesStateCopyWithImpl<SearchRecipesState>(this as SearchRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipesState&&const DeepCollectionEquality().equals(other.recipes, recipes)&&const DeepCollectionEquality().equals(other.filterRecipes, filterRecipes)&&const DeepCollectionEquality().equals(other.beforeSearchRecipes, beforeSearchRecipes)&&(identical(other.searchKeyWord, searchKeyWord) || other.searchKeyWord == searchKeyWord)&&(identical(other.searchState, searchState) || other.searchState == searchState)&&(identical(other.isSearchLoading, isSearchLoading) || other.isSearchLoading == isSearchLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),const DeepCollectionEquality().hash(filterRecipes),const DeepCollectionEquality().hash(beforeSearchRecipes),searchKeyWord,searchState,isSearchLoading);

@override
String toString() {
  return 'SearchRecipesState(recipes: $recipes, filterRecipes: $filterRecipes, beforeSearchRecipes: $beforeSearchRecipes, searchKeyWord: $searchKeyWord, searchState: $searchState, isSearchLoading: $isSearchLoading)';
}


}

/// @nodoc
abstract mixin class $SearchRecipesStateCopyWith<$Res>  {
  factory $SearchRecipesStateCopyWith(SearchRecipesState value, $Res Function(SearchRecipesState) _then) = _$SearchRecipesStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, List<Recipe> filterRecipes, List<Recipe> beforeSearchRecipes, String searchKeyWord, bool searchState, bool isSearchLoading
});




}
/// @nodoc
class _$SearchRecipesStateCopyWithImpl<$Res>
    implements $SearchRecipesStateCopyWith<$Res> {
  _$SearchRecipesStateCopyWithImpl(this._self, this._then);

  final SearchRecipesState _self;
  final $Res Function(SearchRecipesState) _then;

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? filterRecipes = null,Object? beforeSearchRecipes = null,Object? searchKeyWord = null,Object? searchState = null,Object? isSearchLoading = null,}) {
  return _then(_self.copyWith(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filterRecipes: null == filterRecipes ? _self.filterRecipes : filterRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,beforeSearchRecipes: null == beforeSearchRecipes ? _self.beforeSearchRecipes : beforeSearchRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,searchKeyWord: null == searchKeyWord ? _self.searchKeyWord : searchKeyWord // ignore: cast_nullable_to_non_nullable
as String,searchState: null == searchState ? _self.searchState : searchState // ignore: cast_nullable_to_non_nullable
as bool,isSearchLoading: null == isSearchLoading ? _self.isSearchLoading : isSearchLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _SearchRecipesState implements SearchRecipesState {
  const _SearchRecipesState({final  List<Recipe> recipes = const [], final  List<Recipe> filterRecipes = const [], final  List<Recipe> beforeSearchRecipes = const [], this.searchKeyWord = '', this.searchState = false, this.isSearchLoading = false}): _recipes = recipes,_filterRecipes = filterRecipes,_beforeSearchRecipes = beforeSearchRecipes;
  

 final  List<Recipe> _recipes;
@override@JsonKey() List<Recipe> get recipes {
  if (_recipes is EqualUnmodifiableListView) return _recipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recipes);
}

 final  List<Recipe> _filterRecipes;
@override@JsonKey() List<Recipe> get filterRecipes {
  if (_filterRecipes is EqualUnmodifiableListView) return _filterRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filterRecipes);
}

 final  List<Recipe> _beforeSearchRecipes;
@override@JsonKey() List<Recipe> get beforeSearchRecipes {
  if (_beforeSearchRecipes is EqualUnmodifiableListView) return _beforeSearchRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_beforeSearchRecipes);
}

@override@JsonKey() final  String searchKeyWord;
@override@JsonKey() final  bool searchState;
@override@JsonKey() final  bool isSearchLoading;

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchRecipesStateCopyWith<_SearchRecipesState> get copyWith => __$SearchRecipesStateCopyWithImpl<_SearchRecipesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchRecipesState&&const DeepCollectionEquality().equals(other._recipes, _recipes)&&const DeepCollectionEquality().equals(other._filterRecipes, _filterRecipes)&&const DeepCollectionEquality().equals(other._beforeSearchRecipes, _beforeSearchRecipes)&&(identical(other.searchKeyWord, searchKeyWord) || other.searchKeyWord == searchKeyWord)&&(identical(other.searchState, searchState) || other.searchState == searchState)&&(identical(other.isSearchLoading, isSearchLoading) || other.isSearchLoading == isSearchLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_recipes),const DeepCollectionEquality().hash(_filterRecipes),const DeepCollectionEquality().hash(_beforeSearchRecipes),searchKeyWord,searchState,isSearchLoading);

@override
String toString() {
  return 'SearchRecipesState(recipes: $recipes, filterRecipes: $filterRecipes, beforeSearchRecipes: $beforeSearchRecipes, searchKeyWord: $searchKeyWord, searchState: $searchState, isSearchLoading: $isSearchLoading)';
}


}

/// @nodoc
abstract mixin class _$SearchRecipesStateCopyWith<$Res> implements $SearchRecipesStateCopyWith<$Res> {
  factory _$SearchRecipesStateCopyWith(_SearchRecipesState value, $Res Function(_SearchRecipesState) _then) = __$SearchRecipesStateCopyWithImpl;
@override @useResult
$Res call({
 List<Recipe> recipes, List<Recipe> filterRecipes, List<Recipe> beforeSearchRecipes, String searchKeyWord, bool searchState, bool isSearchLoading
});




}
/// @nodoc
class __$SearchRecipesStateCopyWithImpl<$Res>
    implements _$SearchRecipesStateCopyWith<$Res> {
  __$SearchRecipesStateCopyWithImpl(this._self, this._then);

  final _SearchRecipesState _self;
  final $Res Function(_SearchRecipesState) _then;

/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipes = null,Object? filterRecipes = null,Object? beforeSearchRecipes = null,Object? searchKeyWord = null,Object? searchState = null,Object? isSearchLoading = null,}) {
  return _then(_SearchRecipesState(
recipes: null == recipes ? _self._recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filterRecipes: null == filterRecipes ? _self._filterRecipes : filterRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,beforeSearchRecipes: null == beforeSearchRecipes ? _self._beforeSearchRecipes : beforeSearchRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,searchKeyWord: null == searchKeyWord ? _self.searchKeyWord : searchKeyWord // ignore: cast_nullable_to_non_nullable
as String,searchState: null == searchState ? _self.searchState : searchState // ignore: cast_nullable_to_non_nullable
as bool,isSearchLoading: null == isSearchLoading ? _self.isSearchLoading : isSearchLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
