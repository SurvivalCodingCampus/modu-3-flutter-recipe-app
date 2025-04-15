// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterSearchState {

 List<String> get timeFilterList; List<String> get rateFilterList; List<String> get categoryFilterList; String get selectTimeString; String get selectRateString; String get selectCategoryString;
/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterSearchStateCopyWith<FilterSearchState> get copyWith => _$FilterSearchStateCopyWithImpl<FilterSearchState>(this as FilterSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterSearchState&&const DeepCollectionEquality().equals(other.timeFilterList, timeFilterList)&&const DeepCollectionEquality().equals(other.rateFilterList, rateFilterList)&&const DeepCollectionEquality().equals(other.categoryFilterList, categoryFilterList)&&(identical(other.selectTimeString, selectTimeString) || other.selectTimeString == selectTimeString)&&(identical(other.selectRateString, selectRateString) || other.selectRateString == selectRateString)&&(identical(other.selectCategoryString, selectCategoryString) || other.selectCategoryString == selectCategoryString));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(timeFilterList),const DeepCollectionEquality().hash(rateFilterList),const DeepCollectionEquality().hash(categoryFilterList),selectTimeString,selectRateString,selectCategoryString);

@override
String toString() {
  return 'FilterSearchState(timeFilterList: $timeFilterList, rateFilterList: $rateFilterList, categoryFilterList: $categoryFilterList, selectTimeString: $selectTimeString, selectRateString: $selectRateString, selectCategoryString: $selectCategoryString)';
}


}

/// @nodoc
abstract mixin class $FilterSearchStateCopyWith<$Res>  {
  factory $FilterSearchStateCopyWith(FilterSearchState value, $Res Function(FilterSearchState) _then) = _$FilterSearchStateCopyWithImpl;
@useResult
$Res call({
 List<String> timeFilterList, List<String> rateFilterList, List<String> categoryFilterList, String selectTimeString, String selectRateString, String selectCategoryString
});




}
/// @nodoc
class _$FilterSearchStateCopyWithImpl<$Res>
    implements $FilterSearchStateCopyWith<$Res> {
  _$FilterSearchStateCopyWithImpl(this._self, this._then);

  final FilterSearchState _self;
  final $Res Function(FilterSearchState) _then;

/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timeFilterList = null,Object? rateFilterList = null,Object? categoryFilterList = null,Object? selectTimeString = null,Object? selectRateString = null,Object? selectCategoryString = null,}) {
  return _then(FilterSearchState(
timeFilterList: null == timeFilterList ? _self.timeFilterList : timeFilterList // ignore: cast_nullable_to_non_nullable
as List<String>,rateFilterList: null == rateFilterList ? _self.rateFilterList : rateFilterList // ignore: cast_nullable_to_non_nullable
as List<String>,categoryFilterList: null == categoryFilterList ? _self.categoryFilterList : categoryFilterList // ignore: cast_nullable_to_non_nullable
as List<String>,selectTimeString: null == selectTimeString ? _self.selectTimeString : selectTimeString // ignore: cast_nullable_to_non_nullable
as String,selectRateString: null == selectRateString ? _self.selectRateString : selectRateString // ignore: cast_nullable_to_non_nullable
as String,selectCategoryString: null == selectCategoryString ? _self.selectCategoryString : selectCategoryString // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
