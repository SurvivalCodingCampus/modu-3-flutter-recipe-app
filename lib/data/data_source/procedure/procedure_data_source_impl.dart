import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:recipe_app/data/model/procedure.dart';

class ProcedureDataSourceImpl implements ProcedureDataSource {
  static const String _url = 'https://raw.githubusercontent.com/junsuk5/mock_json/main/recipe/procedure.json';

  @override
  Future<List<Procedure>> getProcedure() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      final List<dynamic> procedure = decode['procedures'];
      return procedure.map((e) => Procedure.fromJson(e)).toList();
    } else {
      throw Exception('Procedure Exception');
    }
  }


}