import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/procedure_data_source.dart';

import 'package:recipe_app/data/dto/procedures_dto.dart';

class ProcedureDataSourceImpl implements ProcedureDataSource {
  final String path = 'assets/data/procedure.json';

  ProcedureDataSourceImpl();

  @override
  Future<List<ProcedureDto>> getProcedureDtos(int recipId) async {
    try {
      await Future.delayed(const Duration(microseconds: 500000));
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final List<dynamic> proceduresJson = jsonMap['procedures'];
      return proceduresJson
          .map((e) => ProcedureDto.fromJson(e))
          .where((e) => e.recipeId == recipId)
          .toList();
    } catch (e) {
      throw Exception('레시피 순서 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
