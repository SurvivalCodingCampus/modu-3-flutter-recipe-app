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

 List<Recipe> get recipes; List<Recipe> get filterRecipes; String get searchKeyWord; bool get searchState; bool get isSearchLoading;
/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRecipesStateCopyWith<SearchRecipesState> get copyWith => _$SearchRecipesStateCopyWithImpl<SearchRecipesState>(this as SearchRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipesState&&const DeepCollectionEquality().equals(other.recipes, recipes)&&const DeepCollectionEquality().equals(other.filterRecipes, filterRecipes)&&(identical(other.searchKeyWord, searchKeyWord) || other.searchKeyWord == searchKeyWord)&&(identical(other.searchState, searchState) || other.searchState == searchState)&&(identical(other.isSearchLoading, isSearchLoading) || other.isSearchLoading == isSearchLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),const DeepCollectionEquality().hash(filterRecipes),searchKeyWord,searchState,isSearchLoading);

@override
String toString() {
  return 'SearchRecipesState(recipes: $recipes, filterRecipes: $filterRecipes, searchKeyWord: $searchKeyWord, searchState: $searchState, isSearchLoading: $isSearchLoading)';
}


}

/// @nodoc
abstract mixin class $SearchRecipesStateCopyWith<$Res>  {
  factory $SearchRecipesStateCopyWith(SearchRecipesState value, $Res Function(SearchRecipesState) _then) = _$SearchRecipesStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, List<Recipe> filterRecipes, bool searchState, String searchKeyWord, bool isSearchLoading
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
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? filterRecipes = null,Object? searchState = null,Object? searchKeyWord = null,Object? isSearchLoading = null,}) {
  return _then(SearchRecipesState(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filterRecipes: null == filterRecipes ? _self.filterRecipes : filterRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,searchState: null == searchState ? _self.searchState : searchState // ignore: cast_nullable_to_non_nullable
as bool,searchKeyWord: null == searchKeyWord ? _self.searchKeyWord : searchKeyWord // ignore: cast_nullable_to_non_nullable
as String,isSearchLoading: null == isSearchLoading ? _self.isSearchLoading : isSearchLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
