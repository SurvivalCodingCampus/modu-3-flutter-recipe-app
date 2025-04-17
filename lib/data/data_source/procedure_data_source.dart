import 'package:recipe_app/data/dto/dto.dart';

abstract interface class ProcedureDataSource {
  Future<List<ProcedureDto>> getProcedures();
}
