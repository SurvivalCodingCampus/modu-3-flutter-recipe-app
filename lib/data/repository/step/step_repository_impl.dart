import 'package:recipe_app/data/data_source/steps/steps_data_source.dart';
import 'package:recipe_app/data/mapper/step_mapper.dart';
import 'package:recipe_app/domain/model/step.dart';
import 'package:recipe_app/domain/repository/step/step_repository.dart';

class StepRepositoryImpl implements StepRepository {
  final StepsDataSource _dataSource;

  StepRepositoryImpl(this._dataSource);

  @override
  Future<List<Step>> getSteps() async {
    final stepDto = await _dataSource.getAllSteps();

    return stepDto.map((e) => e.toStep()).toList();
  }
}
