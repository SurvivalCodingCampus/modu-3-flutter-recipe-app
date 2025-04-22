import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/data/data_source/search_data_source.dart';
import 'package:recipe_app/data/mapper/search_data_mapper.dart';
import 'package:recipe_app/domain/model/search_data.dart';
import 'package:recipe_app/domain/repository/search_data_repository.dart';

class SearchDataRepositoryImpl implements SearchDataRepository {
  final SearchDataSource _dataSource;

  SearchDataRepositoryImpl({required SearchDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<Result<SearchData>> fetchSearchData() async {
    final dto = await _dataSource.fetchSearchData();
    return Result.success(dto.toSearchData());
  }

  @override
  Future<Result<void>> updateSearchData({
    required String? query,
    required int? rate,
    required List<String>? categories,
  }) async {
    try {
      await _dataSource.updateSearchData(
        query: query,
        rate: rate,
        categories: categories,
      );

      return const Result.success(null);
    } catch (e) {
      return const Result.error(Failure('저장된 검색 값을 찾아오는데 실패하였습니다.'));
    }
  }
}
