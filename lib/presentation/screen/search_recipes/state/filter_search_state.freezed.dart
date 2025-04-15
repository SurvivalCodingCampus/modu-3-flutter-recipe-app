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

 Time get time; int get rate; Category get category;
/// Create a copy of FilterSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterSearchStateCopyWith<FilterSearchState> get copyWith => _$FilterSearchStateCopyWithImpl<FilterSearchState>(this as FilterSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterSearchState&&(identical(other.time, time) || other.time == time)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,time,rate,category);

@override
String toString() {
  return 'FilterSearchState(time: $time, rate: $rate, category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterSearchStateCopyWith<$Res>  {
  factory $FilterSearchStateCopyWith(FilterSearchState value, $Res Function(FilterSearchState) _then) = _$FilterSearchStateCopyWithImpl;
@useResult
$Res call({
 Time time, int rate, Category category
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
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? rate = null,Object? category = null,}) {
  return _then(FilterSearchState(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as Time,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,
  ));
}

}


// dart format on
