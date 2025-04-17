class ProcedureDto {
  int? recipeId;
  int? step;
  String? content;

  ProcedureDto({this.recipeId, this.step, this.content});

  factory ProcedureDto.fromJson(Map<String, dynamic> json) {
    return ProcedureDto(
      recipeId: json['recipeId'] as int?,
      step: json['step'] as int?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'recipeId': recipeId, 'step': step, 'content': content};
  }
}
