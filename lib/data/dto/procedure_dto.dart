class ProcedureStepDto {
  final int? recipeId;
  final int? step;
  final String? content;

  ProcedureStepDto({this.recipeId, this.step, this.content});

  factory ProcedureStepDto.fromJson(Map<String, dynamic> json) {
    return ProcedureStepDto(
      recipeId: json['recipeId'] as int?,
      step: json['step'] as int?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'recipeId': recipeId, 'step': step, 'content': content};
  }
}
