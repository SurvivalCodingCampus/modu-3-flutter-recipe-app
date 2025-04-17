import 'package:freezed_annotation/freezed_annotation.dart';

part 'step.freezed.dart';

// ignore_for_file: annotate_overrides
@freezed
class Step with _$Step {
  final int recipeId;
  final int step;
  final String content;

  Step({required this.recipeId, required this.step, required this.content});
}
