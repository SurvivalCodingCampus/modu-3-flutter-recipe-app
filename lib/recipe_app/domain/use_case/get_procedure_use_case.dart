import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/data/repository/procedure_repository.dart';

class GetProcedureUseCase {
  final ProcedureRepository _repository;

  GetProcedureUseCase({required ProcedureRepository repository})
    : _repository = repository;

  Future<List<Procedure>> execute(int id) async {
    try {
      return await _repository.fetchProcedure(id);
    } catch (e) {
      throw Exception('단계 오류 실패');
    }
  }
}
