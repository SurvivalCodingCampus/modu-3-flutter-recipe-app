import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/utils/errors/procedure_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

abstract interface class ProcedureRepository {
  Future<Result<List<Procedure>, ProcedureErrorEnum>> findProcedureByRecipeId(
    int id,
  );
}
