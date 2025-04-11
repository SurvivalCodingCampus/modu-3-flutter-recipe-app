// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_amount_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientAmountDto {

 IngredientDto? get ingredients; int? get amount;
/// Create a copy of IngredientAmountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientAmountDtoCopyWith<IngredientAmountDto> get copyWith => _$IngredientAmountDtoCopyWithImpl<IngredientAmountDto>(this as IngredientAmountDto, _$identity);

  /// Serializes this IngredientAmountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientAmountDto&&(identical(other.ingredients, ingredients) || other.ingredients == ingredients)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredients,amount);

@override
String toString() {
  return 'IngredientAmountDto(ingredients: $ingredients, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $IngredientAmountDtoCopyWith<$Res>  {
  factory $IngredientAmountDtoCopyWith(IngredientAmountDto value, $Res Function(IngredientAmountDto) _then) = _$IngredientAmountDtoCopyWithImpl;
@useResult
$Res call({
 IngredientDto? ingredients, int? amount
});


$IngredientDtoCopyWith<$Res>? get ingredients;

}
/// @nodoc
class _$IngredientAmountDtoCopyWithImpl<$Res>
    implements $IngredientAmountDtoCopyWith<$Res> {
  _$IngredientAmountDtoCopyWithImpl(this._self, this._then);

  final IngredientAmountDto _self;
  final $Res Function(IngredientAmountDto) _then;

/// Create a copy of IngredientAmountDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredients = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
ingredients: freezed == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as IngredientDto?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of IngredientAmountDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientDtoCopyWith<$Res>? get ingredients {
    if (_self.ingredients == null) {
    return null;
  }

  return $IngredientDtoCopyWith<$Res>(_self.ingredients!, (value) {
    return _then(_self.copyWith(ingredients: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _IngredientAmountDto implements IngredientAmountDto {
  const _IngredientAmountDto({this.ingredients, this.amount});
  factory _IngredientAmountDto.fromJson(Map<String, dynamic> json) => _$IngredientAmountDtoFromJson(json);

@override final  IngredientDto? ingredients;
@override final  int? amount;

/// Create a copy of IngredientAmountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientAmountDtoCopyWith<_IngredientAmountDto> get copyWith => __$IngredientAmountDtoCopyWithImpl<_IngredientAmountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientAmountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientAmountDto&&(identical(other.ingredients, ingredients) || other.ingredients == ingredients)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredients,amount);

@override
String toString() {
  return 'IngredientAmountDto(ingredients: $ingredients, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$IngredientAmountDtoCopyWith<$Res> implements $IngredientAmountDtoCopyWith<$Res> {
  factory _$IngredientAmountDtoCopyWith(_IngredientAmountDto value, $Res Function(_IngredientAmountDto) _then) = __$IngredientAmountDtoCopyWithImpl;
@override @useResult
$Res call({
 IngredientDto? ingredients, int? amount
});


@override $IngredientDtoCopyWith<$Res>? get ingredients;

}
/// @nodoc
class __$IngredientAmountDtoCopyWithImpl<$Res>
    implements _$IngredientAmountDtoCopyWith<$Res> {
  __$IngredientAmountDtoCopyWithImpl(this._self, this._then);

  final _IngredientAmountDto _self;
  final $Res Function(_IngredientAmountDto) _then;

/// Create a copy of IngredientAmountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredients = freezed,Object? amount = freezed,}) {
  return _then(_IngredientAmountDto(
ingredients: freezed == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as IngredientDto?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of IngredientAmountDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IngredientDtoCopyWith<$Res>? get ingredients {
    if (_self.ingredients == null) {
    return null;
  }

  return $IngredientDtoCopyWith<$Res>(_self.ingredients!, (value) {
    return _then(_self.copyWith(ingredients: value));
  });
}
}

// dart format on
