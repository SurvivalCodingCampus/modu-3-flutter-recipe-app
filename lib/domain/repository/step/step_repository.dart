import 'package:recipe_app/domain/model/step.dart';

abstract interface class StepRepository {
  Future<List<Step>> getSteps();
}
