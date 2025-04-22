import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/bookmark/bookmark_data_source.dart';
import 'package:recipe_app/data/dto/bookmark_dto.dart';

class BookmarkDataSourceImpl implements BookmarkDataSource {
  @override
  Future<List<BookmarkDto>> getBookmarks() async {
    final jsonString = await rootBundle.loadString('assets/json/bookmark.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((e) => BookmarkDto.fromJson(e)).toList();
  }
}
