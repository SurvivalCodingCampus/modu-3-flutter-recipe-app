// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchRecipeState {

 List<Recipe> get searchRecipes; bool get isLoading; List<Recipe> get filterRecipes; String get keyword; FilterSearchState get filterSearchState;
/// Create a copy of SearchRecipeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRecipeStateCopyWith<SearchRecipeState> get copyWith => _$SearchRecipeStateCopyWithImpl<SearchRecipeState>(this as SearchRecipeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipeState&&const DeepCollectionEquality().equals(other.searchRecipes, searchRecipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.filterRecipes, filterRecipes)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.filterSearchState, filterSearchState) || other.filterSearchState == filterSearchState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(searchRecipes),isLoading,const DeepCollectionEquality().hash(filterRecipes),keyword,filterSearchState);

@override
String toString() {
  return 'SearchRecipeState(searchRecipes: $searchRecipes, isLoading: $isLoading, filterRecipes: $filterRecipes, keyword: $keyword, filterSearchState: $filterSearchState)';
}


}

/// @nodoc
abstract mixin class $SearchRecipeStateCopyWith<$Res>  {
  factory $SearchRecipeStateCopyWith(SearchRecipeState value, $Res Function(SearchRecipeState) _then) = _$SearchRecipeStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> searchRecipes, List<Recipe> filterRecipes, bool isLoading, String keyword, FilterSearchState filterSearchState
});




}
/// @nodoc
class _$SearchRecipeStateCopyWithImpl<$Res>
    implements $SearchRecipeStateCopyWith<$Res> {
  _$SearchRecipeStateCopyWithImpl(this._self, this._then);

  final SearchRecipeState _self;
  final $Res Function(SearchRecipeState) _then;

/// Create a copy of SearchRecipeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchRecipes = null,Object? filterRecipes = null,Object? isLoading = null,Object? keyword = null,Object? filterSearchState = null,}) {
  return _then(SearchRecipeState(
searchRecipes: null == searchRecipes ? _self.searchRecipes : searchRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filterRecipes: null == filterRecipes ? _self.filterRecipes : filterRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,filterSearchState: null == filterSearchState ? _self.filterSearchState : filterSearchState // ignore: cast_nullable_to_non_nullable
as FilterSearchState,
  ));
}

}


// dart format on
