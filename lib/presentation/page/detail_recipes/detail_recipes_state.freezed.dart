// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailRecipesState {

 Recipe get recipesData; bool get showMoreMenu;
/// Create a copy of DetailRecipesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailRecipesStateCopyWith<DetailRecipesState> get copyWith => _$DetailRecipesStateCopyWithImpl<DetailRecipesState>(this as DetailRecipesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailRecipesState&&(identical(other.recipesData, recipesData) || other.recipesData == recipesData)&&(identical(other.showMoreMenu, showMoreMenu) || other.showMoreMenu == showMoreMenu));
}


@override
int get hashCode => Object.hash(runtimeType,recipesData,showMoreMenu);

@override
String toString() {
  return 'DetailRecipesState(recipesData: $recipesData, showMoreMenu: $showMoreMenu)';
}


}

/// @nodoc
abstract mixin class $DetailRecipesStateCopyWith<$Res>  {
  factory $DetailRecipesStateCopyWith(DetailRecipesState value, $Res Function(DetailRecipesState) _then) = _$DetailRecipesStateCopyWithImpl;
@useResult
$Res call({
 Recipe recipesData, bool showMoreMenu
});


$RecipeCopyWith<$Res> get recipesData;

}
/// @nodoc
class _$DetailRecipesStateCopyWithImpl<$Res>
    implements $DetailRecipesStateCopyWith<$Res> {
  _$DetailRecipesStateCopyWithImpl(this._self, this._then);

  final DetailRecipesState _self;
  final $Res Function(DetailRecipesState) _then;

/// Create a copy of DetailRecipesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipesData = null,Object? showMoreMenu = null,}) {
  return _then(_self.copyWith(
recipesData: null == recipesData ? _self.recipesData : recipesData // ignore: cast_nullable_to_non_nullable
as Recipe,showMoreMenu: null == showMoreMenu ? _self.showMoreMenu : showMoreMenu // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DetailRecipesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipesData {
  
  return $RecipeCopyWith<$Res>(_self.recipesData, (value) {
    return _then(_self.copyWith(recipesData: value));
  });
}
}


/// @nodoc


class _DetailRecipesState implements DetailRecipesState {
  const _DetailRecipesState({required this.recipesData, this.showMoreMenu = false});
  

@override final  Recipe recipesData;
@override@JsonKey() final  bool showMoreMenu;

/// Create a copy of DetailRecipesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailRecipesStateCopyWith<_DetailRecipesState> get copyWith => __$DetailRecipesStateCopyWithImpl<_DetailRecipesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailRecipesState&&(identical(other.recipesData, recipesData) || other.recipesData == recipesData)&&(identical(other.showMoreMenu, showMoreMenu) || other.showMoreMenu == showMoreMenu));
}


@override
int get hashCode => Object.hash(runtimeType,recipesData,showMoreMenu);

@override
String toString() {
  return 'DetailRecipesState(recipesData: $recipesData, showMoreMenu: $showMoreMenu)';
}


}

/// @nodoc
abstract mixin class _$DetailRecipesStateCopyWith<$Res> implements $DetailRecipesStateCopyWith<$Res> {
  factory _$DetailRecipesStateCopyWith(_DetailRecipesState value, $Res Function(_DetailRecipesState) _then) = __$DetailRecipesStateCopyWithImpl;
@override @useResult
$Res call({
 Recipe recipesData, bool showMoreMenu
});


@override $RecipeCopyWith<$Res> get recipesData;

}
/// @nodoc
class __$DetailRecipesStateCopyWithImpl<$Res>
    implements _$DetailRecipesStateCopyWith<$Res> {
  __$DetailRecipesStateCopyWithImpl(this._self, this._then);

  final _DetailRecipesState _self;
  final $Res Function(_DetailRecipesState) _then;

/// Create a copy of DetailRecipesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipesData = null,Object? showMoreMenu = null,}) {
  return _then(_DetailRecipesState(
recipesData: null == recipesData ? _self.recipesData : recipesData // ignore: cast_nullable_to_non_nullable
as Recipe,showMoreMenu: null == showMoreMenu ? _self.showMoreMenu : showMoreMenu // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DetailRecipesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res> get recipesData {
  
  return $RecipeCopyWith<$Res>(_self.recipesData, (value) {
    return _then(_self.copyWith(recipesData: value));
  });
}
}

// dart format on
