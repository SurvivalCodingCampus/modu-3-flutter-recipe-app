// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavedRecipeState {

 List<Recipe> get savedRecipes; bool get isLoading;
/// Create a copy of SavedRecipeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedRecipeStateCopyWith<SavedRecipeState> get copyWith => _$SavedRecipeStateCopyWithImpl<SavedRecipeState>(this as SavedRecipeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedRecipeState&&const DeepCollectionEquality().equals(other.savedRecipes, savedRecipes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(savedRecipes),isLoading);

@override
String toString() {
  return 'SavedRecipeState(savedRecipes: $savedRecipes, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $SavedRecipeStateCopyWith<$Res>  {
  factory $SavedRecipeStateCopyWith(SavedRecipeState value, $Res Function(SavedRecipeState) _then) = _$SavedRecipeStateCopyWithImpl;
@useResult
$Res call({
 List<Recipe> savedRecipes, bool isLoading
});




}
/// @nodoc
class _$SavedRecipeStateCopyWithImpl<$Res>
    implements $SavedRecipeStateCopyWith<$Res> {
  _$SavedRecipeStateCopyWithImpl(this._self, this._then);

  final SavedRecipeState _self;
  final $Res Function(SavedRecipeState) _then;

/// Create a copy of SavedRecipeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? savedRecipes = null,Object? isLoading = null,}) {
  return _then(SavedRecipeState(
savedRecipes: null == savedRecipes ? _self.savedRecipes : savedRecipes // ignore: cast_nullable_to_non_nullable
as List<Recipe>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


// dart format on
