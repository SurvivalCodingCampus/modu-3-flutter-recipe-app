import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';
part 'procedure.g.dart';

// ignore_for_file: annotate_overrides
@freezed
@JsonSerializable()
class Procedure with _$Procedure {
  final int recipeId;
  final int step;
  final String content;

  const Procedure({
    required this.recipeId,
    required this.step,
    required this.content,
  });

  factory Procedure.fromJson(Map<String, dynamic> json) => _$ProcedureFromJson(json);
  Map<String, dynamic> toJson() => _$ProcedureToJson(this);
}
