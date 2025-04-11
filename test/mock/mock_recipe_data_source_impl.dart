import 'dart:convert';

import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/domain/data_source/recipe_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/utils/constant/http_url.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';

class MockRecipeDataSourceImpl implements RecipeDataSource<RecipeDto> {
  final http.Client client;

  MockRecipeDataSourceImpl({required this.client});

  @override
  Future<RecipeDto> findData(int id) {
    // TODO: implement findData
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeDto>> findDatas() async {
    final response = await client.get(
      Uri.parse('${HttpUrl.baseUrl}${RecipeDataSourceImpl.endpoint}'),
    );

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final List<dynamic> listData = json['recipes'];

      return listData
          .map((e) => RecipeDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw RecipeErrorEnum.networkerror;
    }
  }
}
