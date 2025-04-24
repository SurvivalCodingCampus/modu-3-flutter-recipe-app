import 'package:recipe_app/domain/model/procedure/procedure.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';

class GetRecipeProcedureUseCase {
  final ProcedureRepository _repository;

  GetRecipeProcedureUseCase({required ProcedureRepository repository})
    : _repository = repository;

  Future<List<Procedure>> execute(int recipeId) async {
    return await _repository.getProcedureDto(recipeId);
  }
}
