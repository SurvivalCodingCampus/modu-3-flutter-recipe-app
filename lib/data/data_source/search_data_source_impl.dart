import 'package:recipe_app/core/platform/json_storage.dart';
import 'package:recipe_app/core/platform/json_storage_key.dart';
import 'package:recipe_app/data/dto/search_data_dto.dart';

import 'search_data_source.dart';

class SearchDataSourceImpl implements SearchDataSource {
  @override
  Future<SearchDataDto> fetchSearchData() async {
    final json = await JsonStorage.load(JsonStorageKey.search_data);

    if (json == null) {
      return SearchDataDto(query: null, rate: null, categories: null);
    }

    return SearchDataDto(
      query: json['query'] as String?,
      rate: json['rate'] as num?,
      categories:
          (json['categories'] is List)
              ? (json['categories'] as List<dynamic>).cast<String>()
              : null,
    );
  }

  @override
  Future<void> updateSearchData({
    required String? query,
    required int? rate,
    required List<String>? categories,
  }) async {
    Map<String, dynamic> map = {};

    if (query!.isNotEmpty) {
      map['query'] = query;
    }

    if (rate != null) {
      map['rate'] = rate;
    }

    if (categories != null && categories.isNotEmpty) {
      map['categories'] = categories;
    }

    await JsonStorage.save(JsonStorageKey.search_data, map);
  }
}
