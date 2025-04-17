import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure_dto.g.dart';

@JsonSerializable()
class ProcedureDto {
  final num? recipeId;
  final num? step;
  final String? content;

  const ProcedureDto(this.recipeId, this.step, this.content);

  factory ProcedureDto.fromJson(Map<String, dynamic> json) =>
      _$ProcedureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProcedureDtoToJson(this);
}
