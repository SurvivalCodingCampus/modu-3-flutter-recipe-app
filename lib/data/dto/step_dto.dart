class StepDto {
  final num? step;
  final String? content;
  final num? recipeId;

  StepDto({required this.step, required this.content, required this.recipeId});

  factory StepDto.fromJson(Map<String, dynamic> json) {
    return StepDto(
      step: json['step'] as int,
      content: json['content'] as String,
      recipeId: json['recipeId'] as int,
    );
  }
}
