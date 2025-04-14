import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:recipe_app/domain/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/utils/constant/http_url.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';

class RecipeDataSourceImpl implements RecipeDataSource<RecipeDto> {
  static const String endpoint = 'recipes.json';

  @override
  Future<RecipeDto> findData(int id) async {
    final response = await http.get(
      Uri.parse('${HttpUrl.baseUrl}$endpoint/$id'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      return RecipeDto.fromJson(json);
    } else {
      throw RecipeErrorEnum.networkerror;
    }
  }

  @override
  Future<List<RecipeDto>> findDatas() async {
    final response = await http
        .get(
          Uri.parse('${HttpUrl.baseUrl}$endpoint'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        )
        .timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw RecipeErrorEnum.timeouterror;
          },
        );

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final List<dynamic> listData = json['recipes'];

      return listData
          .map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      if (response.statusCode == 404) throw RecipeErrorEnum.notfounderror;
      throw RecipeErrorEnum.networkerror;
    }
  }
}
