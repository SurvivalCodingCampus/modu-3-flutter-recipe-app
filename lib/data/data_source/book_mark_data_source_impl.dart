import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/book_mark_data_source.dart';
import 'package:recipe_app/data/dto/book_mark_dto.dart';

class BookMarkDataSourceImpl implements BookMarkDataSource {
  final String assetPath = 'assets/data/book_mark.json';
  BookMarkDataSourceImpl();

  @override
  Future<BookMarkDto> getBookMarkDto(int id) async {
    try {
      await Future.delayed(const Duration(microseconds: 500000));
      final jsonString = await rootBundle.loadString(assetPath);
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((e) => BookMarkDto.fromJson(e))
          .firstWhere((e) => e.userId == id);
    } catch (e) {
      throw Exception('데이터를 불러오는 데 실패했습니다.');
    }
  }
}
