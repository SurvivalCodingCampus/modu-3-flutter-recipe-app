// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SaveRecipesState {

 bool get isLoading; List<Recipe> get recipeList;
/// Create a copy of SaveRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveRecipesStateCopyWith<SaveRecipesState> get copyWith => _$SaveRecipesStateCopyWithImpl<SaveRecipesState>(this as SaveRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveRecipesState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.recipeList, recipeList));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(recipeList));

@override
String toString() {
  return 'SaveRecipesState(isLoading: $isLoading, recipeList: $recipeList)';
}


}

/// @nodoc
abstract mixin class $SaveRecipesStateCopyWith<$Res>  {
  factory $SaveRecipesStateCopyWith(SaveRecipesState value, $Res Function(SaveRecipesState) _then) = _$SaveRecipesStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Recipe> recipeList
});




}
/// @nodoc
class _$SaveRecipesStateCopyWithImpl<$Res>
    implements $SaveRecipesStateCopyWith<$Res> {
  _$SaveRecipesStateCopyWithImpl(this._self, this._then);

  final SaveRecipesState _self;
  final $Res Function(SaveRecipesState) _then;

/// Create a copy of SaveRecipesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? recipeList = null,}) {
  return _then(SaveRecipesState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,recipeList: null == recipeList ? _self.recipeList : recipeList // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}

}


// dart format on
