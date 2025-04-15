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

 List<Recipe> get recipes; List<Recipe> get filterRecipes; String get searchKeyword; bool get isLoading;
/// Create a copy of SearchRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchRecipesStateCopyWith<SearchRecipesState> get copyWith => _$SearchRecipesStateCopyWithImpl<SearchRecipesState>(this as SearchRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchRecipesState&&const DeepCollectionEquality().equals(other.recipes, recipes)&&const DeepCollectionEquality().equals(other.filterRecipes, filterRecipes)&&(identical(other.searchKeyword, searchKeyword) || other.searchKeyword == searchKeyword)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recipes),const DeepCollectionEquality().hash(filterRecipes),searchKeyword,isLoading);

@override
String toString() {
  return 'SearchRecipesState(recipes: $recipes, filterRecipes: $filterRecipes, searchKeyword: $searchKeyword, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SearchRecipesStateCopyWith<$Res>  {
  factory $SearchRecipesStateCopyWith(SearchRecipesState value, $Res Function(SearchRecipesState) _then) = _$SearchRecipesStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> recipes, List<Recipe> filterRecipes, String searchKeyword, bool isLoading
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
@pragma('vm:prefer-inline') @override $Res call({Object? recipes = null,Object? filterRecipes = null,Object? searchKeyword = null,Object? isLoading = null,}) {
  return _then(SearchRecipesState(
recipes: null == recipes ? _self.recipes : recipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,filterRecipes: null == filterRecipes ? _self.filterRecipes : filterRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,searchKeyword: null == searchKeyword ? _self.searchKeyword : searchKeyword // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
