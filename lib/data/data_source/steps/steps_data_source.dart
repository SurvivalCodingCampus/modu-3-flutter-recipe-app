import 'package:recipe_app/data/dto/step_dto.dart';

abstract interface class StepsDataSource {
  Future<List<StepDto>> getAllSteps();
}
