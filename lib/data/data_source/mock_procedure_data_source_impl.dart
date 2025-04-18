import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/procedure_data_source.dart';

class MockProcedureDataSourceImpl implements ProcedureDataSource {
  @override
  Future<List<Map<String, dynamic>>> getProcedures() async {
    final String fileString = await rootBundle.loadString('assets/mock_data/procedure.json');
    final Map<String, dynamic> json = jsonDecode(fileString);
    final List<dynamic> procedures = json['procedures'];
    return procedures.map((procedure) => procedure as Map<String, dynamic>).toList();
  }
}