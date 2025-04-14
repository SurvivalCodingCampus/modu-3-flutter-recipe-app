// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'procedure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Procedure {

 String get recipeId; int get step; String get content;
/// Create a copy of Procedure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcedureCopyWith<Procedure> get copyWith => _$ProcedureCopyWithImpl<Procedure>(this as Procedure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Procedure&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.step, step) || other.step == step)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipeId,step,content);

@override
String toString() {
  return 'Procedure(recipeId: $recipeId, step: $step, content: $content)';
}


}

/// @nodoc
abstract mixin class $ProcedureCopyWith<$Res>  {
  factory $ProcedureCopyWith(Procedure value, $Res Function(Procedure) _then) = _$ProcedureCopyWithImpl;
@useResult
$Res call({
 String recipeId, int step, String content
});




}
/// @nodoc
class _$ProcedureCopyWithImpl<$Res>
    implements $ProcedureCopyWith<$Res> {
  _$ProcedureCopyWithImpl(this._self, this._then);

  final Procedure _self;
  final $Res Function(Procedure) _then;

/// Create a copy of Procedure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipeId = null,Object? step = null,Object? content = null,}) {
  return _then(Procedure(
recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
