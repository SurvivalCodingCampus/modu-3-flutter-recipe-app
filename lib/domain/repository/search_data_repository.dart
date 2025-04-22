import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/domain/model/search_data.dart';

abstract interface class SearchDataRepository {
  Future<Result<SearchData>> fetchSearchData();
  Future<Result<void>> updateSearchData({
    required String? query,
    required int? rate,
    required List<String>? categories,
  });
}
