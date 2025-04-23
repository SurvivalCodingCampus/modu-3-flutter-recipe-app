import 'package:json_annotation/json_annotation.dart';

part 'procedure_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProcedureDto {
  final num? recipeId;
  final num? step;
  final String? content;

  ProcedureDto(this.recipeId, this.step, this.content);

  factory ProcedureDto.fromJson(Map<String, dynamic> json) =>
      _$ProcedureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProcedureDtoToJson(this);
}
