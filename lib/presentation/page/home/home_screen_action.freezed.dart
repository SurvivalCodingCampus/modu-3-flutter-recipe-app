// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeScreenAction {

 List<Recipe> get searchData;
/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeScreenActionCopyWith<HomeScreenAction> get copyWith => _$HomeScreenActionCopyWithImpl<HomeScreenAction>(this as HomeScreenAction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeScreenAction&&const DeepCollectionEquality().equals(other.searchData, searchData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(searchData));

@override
String toString() {
  return 'HomeScreenAction(searchData: $searchData)';
}


}

/// @nodoc
abstract mixin class $HomeScreenActionCopyWith<$Res>  {
  factory $HomeScreenActionCopyWith(HomeScreenAction value, $Res Function(HomeScreenAction) _then) = _$HomeScreenActionCopyWithImpl;
@useResult
$Res call({
 List<Recipe> searchData
});




}
/// @nodoc
class _$HomeScreenActionCopyWithImpl<$Res>
    implements $HomeScreenActionCopyWith<$Res> {
  _$HomeScreenActionCopyWithImpl(this._self, this._then);

  final HomeScreenAction _self;
  final $Res Function(HomeScreenAction) _then;

/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchData = null,}) {
  return _then(_self.copyWith(
searchData: null == searchData ? _self.searchData : searchData // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}

}


/// @nodoc


class OnTapSearchBar implements HomeScreenAction {
  const OnTapSearchBar({required final  List<Recipe> searchData}): _searchData = searchData;
  

 final  List<Recipe> _searchData;
@override List<Recipe> get searchData {
  if (_searchData is EqualUnmodifiableListView) return _searchData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchData);
}


/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnTapSearchBarCopyWith<OnTapSearchBar> get copyWith => _$OnTapSearchBarCopyWithImpl<OnTapSearchBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTapSearchBar&&const DeepCollectionEquality().equals(other._searchData, _searchData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_searchData));

@override
String toString() {
  return 'HomeScreenAction.onTapSearchBar(searchData: $searchData)';
}


}

/// @nodoc
abstract mixin class $OnTapSearchBarCopyWith<$Res> implements $HomeScreenActionCopyWith<$Res> {
  factory $OnTapSearchBarCopyWith(OnTapSearchBar value, $Res Function(OnTapSearchBar) _then) = _$OnTapSearchBarCopyWithImpl;
@override @useResult
$Res call({
 List<Recipe> searchData
});




}
/// @nodoc
class _$OnTapSearchBarCopyWithImpl<$Res>
    implements $OnTapSearchBarCopyWith<$Res> {
  _$OnTapSearchBarCopyWithImpl(this._self, this._then);

  final OnTapSearchBar _self;
  final $Res Function(OnTapSearchBar) _then;

/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchData = null,}) {
  return _then(OnTapSearchBar(
searchData: null == searchData ? _self._searchData : searchData // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}


}

// dart format on
