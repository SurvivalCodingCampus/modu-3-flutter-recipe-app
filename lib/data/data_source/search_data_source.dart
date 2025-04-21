import 'package:recipe_app/data/dto/search_data_dto.dart';

abstract interface class SearchDataSource {
  Future<SearchDataDto> fetchSearchData();
  Future<void> updateSearchData({
    required String? query,
    required int? rate,
    required List<String>? categories,
  });
}
