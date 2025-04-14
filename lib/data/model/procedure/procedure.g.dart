// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Procedure _$ProcedureFromJson(Map<String, dynamic> json) => Procedure(
  recipeId: json['recipeId'] as String,
  step: (json['step'] as num).toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$ProcedureToJson(Procedure instance) => <String, dynamic>{
  'recipeId': instance.recipeId,
  'step': instance.step,
  'content': instance.content,
};
