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

  /// Serializes this Filter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Filter&&(identical(other.time, time) || other.time == time)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
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
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as Time,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Filter implements Filter {
  const _Filter({this.time = Time.all, this.rate = Rate.star1, this.category = Category.all});
  factory _Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

@override@JsonKey() final  Time time;
@override@JsonKey() final  Rate rate;
@override@JsonKey() final  Category category;

/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterCopyWith<_Filter> get copyWith => __$FilterCopyWithImpl<_Filter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Filter&&(identical(other.time, time) || other.time == time)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,rate,category);

@override
String toString() {
  return 'Filter(time: $time, rate: $rate, category: $category)';
}


}

/// @nodoc
abstract mixin class _$FilterCopyWith<$Res> implements $FilterCopyWith<$Res> {
  factory _$FilterCopyWith(_Filter value, $Res Function(_Filter) _then) = __$FilterCopyWithImpl;
@override @useResult
$Res call({
 Time time, Rate rate, Category category
});




}
/// @nodoc
class __$FilterCopyWithImpl<$Res>
    implements _$FilterCopyWith<$Res> {
  __$FilterCopyWithImpl(this._self, this._then);

  final _Filter _self;
  final $Res Function(_Filter) _then;

/// Create a copy of Filter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? rate = null,Object? category = null,}) {
  return _then(_Filter(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as Time,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Rate,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,
  ));
}


}

// dart format on
