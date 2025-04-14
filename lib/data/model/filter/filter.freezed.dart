// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Filter {

 Time get time; Rate get rate; Category get category;
/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterCopyWith<Filter> get copyWith => _$FilterCopyWithImpl<Filter>(this as Filter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Filter&&(identical(other.time, time) || other.time == time)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,time,rate,category);

@override
String toString() {
  return 'Filter(time: $time, rate: $rate, category: $category)';
}


}

/// @nodoc
abstract mixin class $FilterCopyWith<$Res>  {
  factory $FilterCopyWith(Filter value, $Res Function(Filter) _then) = _$FilterCopyWithImpl;
@useResult
$Res call({
 Time time, Rate rate, Category category
});




}
/// @nodoc
class _$FilterCopyWithImpl<$Res>
    implements $FilterCopyWith<$Res> {
  _$FilterCopyWithImpl(this._self, this._then);

  final Filter _self;
  final $Res Function(Filter) _then;

/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? rate = null,Object? category = null,}) {
  return _then(Filter(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as Time,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,
  ));
}

}


// dart format on
