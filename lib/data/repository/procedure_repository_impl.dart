import 'package:recipe_app/data/dto/procedure_dto.dart';
import 'package:recipe_app/data/mapper/procedure_mapper.dart';
import 'package:recipe_app/domain/data_source/procedure_data_source.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/utils/errors/procedure_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource<ProcedureDto> _dataSource;

  const ProcedureRepositoryImpl(ProcedureDataSource<ProcedureDto> dataSource)
    : _dataSource = dataSource;

  @override
  Future<Result<List<Procedure>, ProcedureErrorEnum>> findProcedureByRecipeId(
    int id,
  ) async {
    try {
      List<ProcedureDto> result = await _dataSource.findDatas();
      result = result.where((e) => e.recipeId == id).toList();

      return Result.success(result.map((e) => e.toProcedure()).toList());
    } on ProcedureErrorEnum {
      return const Result.error(ProcedureErrorEnum.networkerror);
    }
  }
}
