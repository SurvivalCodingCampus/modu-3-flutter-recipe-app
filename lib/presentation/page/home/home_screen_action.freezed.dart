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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeScreenAction);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeScreenAction()';
}


}

/// @nodoc
class $HomeScreenActionCopyWith<$Res>  {
$HomeScreenActionCopyWith(HomeScreenAction _, $Res Function(HomeScreenAction) __);
}


/// @nodoc


class OnTapSearchBar implements HomeScreenAction {
  const OnTapSearchBar({required final  List<Recipe> searchData}): _searchData = searchData;
  

 final  List<Recipe> _searchData;
 List<Recipe> get searchData {
  if (_searchData is EqualUnmodifiableListView) return _searchData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_searchData);
}


/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
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
@useResult
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
@pragma('vm:prefer-inline') $Res call({Object? searchData = null,}) {
  return _then(OnTapSearchBar(
searchData: null == searchData ? _self._searchData : searchData // ignore: cast_nullable_to_non_nullable
as List<Recipe>,
  ));
}


}

/// @nodoc


class OnTapCategoryBadge implements HomeScreenAction {
  const OnTapCategoryBadge({required this.selectString});
  

 final  String selectString;

/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnTapCategoryBadgeCopyWith<OnTapCategoryBadge> get copyWith => _$OnTapCategoryBadgeCopyWithImpl<OnTapCategoryBadge>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnTapCategoryBadge&&(identical(other.selectString, selectString) || other.selectString == selectString));
}


@override
int get hashCode => Object.hash(runtimeType,selectString);

@override
String toString() {
  return 'HomeScreenAction.onTapCategoryBadge(selectString: $selectString)';
}


}

/// @nodoc
abstract mixin class $OnTapCategoryBadgeCopyWith<$Res> implements $HomeScreenActionCopyWith<$Res> {
  factory $OnTapCategoryBadgeCopyWith(OnTapCategoryBadge value, $Res Function(OnTapCategoryBadge) _then) = _$OnTapCategoryBadgeCopyWithImpl;
@useResult
$Res call({
 String selectString
});




}
/// @nodoc
class _$OnTapCategoryBadgeCopyWithImpl<$Res>
    implements $OnTapCategoryBadgeCopyWith<$Res> {
  _$OnTapCategoryBadgeCopyWithImpl(this._self, this._then);

  final OnTapCategoryBadge _self;
  final $Res Function(OnTapCategoryBadge) _then;

/// Create a copy of HomeScreenAction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectString = null,}) {
  return _then(OnTapCategoryBadge(
selectString: null == selectString ? _self.selectString : selectString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class onLoadPageLoadEvent implements HomeScreenAction {
  const onLoadPageLoadEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is onLoadPageLoadEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeScreenAction.onLoadPageLoadEvent()';
}


}




// dart format on
