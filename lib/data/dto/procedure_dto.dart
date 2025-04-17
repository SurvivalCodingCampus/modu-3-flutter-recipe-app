import 'package:json_annotation/json_annotation.dart';

part 'procedure_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProcedureDto {
  final int? recipeId;
  final int? step;
  final String? content;

  const ProcedureDto({
    required this.recipeId,
    required this.step,
    required this.content,
  });

  factory ProcedureDto.fromJson(Map<String, dynamic> json) =>
      _$ProcedureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProcedureDtoToJson(this);
}
