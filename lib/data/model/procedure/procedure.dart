// [Procedure] 요리 순서를 저장합니다.
// ignore_for_file: annotate_overrides
import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';
part 'procedure.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Procedure with _$Procedure {
  final String recipeId;
  final int step;
  final String content;
  Procedure({
    required this.recipeId,
    required this.step,
    required this.content,
  });
  factory Procedure.fromJson(Map<String, dynamic> json) =>
      _$ProcedureFromJson(json);
  Map<String, dynamic> toJson() => _$ProcedureToJson(this);
}
