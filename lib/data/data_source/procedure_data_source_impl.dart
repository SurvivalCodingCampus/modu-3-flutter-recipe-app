import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recipe_app/data/dto/procedure_dto.dart';
import 'package:recipe_app/domain/data_source/procedure_data_source.dart';
import 'package:recipe_app/utils/constant/http_url.dart';
import 'package:recipe_app/utils/errors/procedure_error_enum.dart';

class ProcedureDataSourceImpl implements ProcedureDataSource<ProcedureDto> {
  static const String endPoint = 'procedure.json';

  @override
  Future<ProcedureDto> findData(int id) {
    // TODO: implement findData
    throw UnimplementedError();
  }

  @override
  Future<List<ProcedureDto>> findDatas() async {
    final response = await http
        .get(
          Uri.parse('${HttpUrl.baseUrl}$endPoint'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw ProcedureErrorEnum.timeouterror;
          },
        );

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final List<dynamic> listData = json['procedures'];

      return listData
          .map((e) => ProcedureDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      if (response.statusCode == 404) throw ProcedureErrorEnum.notfounderror;
      throw ProcedureErrorEnum.networkerror;
    }
  }
}
