

import 'package:freezed_annotation/freezed_annotation.dart';

import 'ingredients.dart';

part 'procedure.freezed.dart';

part 'procedure.g.dart';

@freezed
abstract class Procedure with _$Procedure {
  const factory Procedure({
    required int recipeId,
    required int step,
    required String content,
    required String chef,
    required String time,
    required double rating,
    required Ingredients ingredients,
  }) = _Procedure;
  
  factory Procedure.fromJson(Map<String, Object?> json) => _$ProcedureFromJson(json); 
}