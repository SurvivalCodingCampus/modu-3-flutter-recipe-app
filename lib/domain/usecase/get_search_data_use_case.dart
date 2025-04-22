import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/model/search_data.dart';
import 'package:recipe_app/domain/repository/search_data_repository.dart';

class GetSearchDataUseCase {
  final SearchDataRepository _repository;

  GetSearchDataUseCase(this._repository);

  Future<UiState<SearchData>> execute() async {
    final result = await _repository.fetchSearchData();

    return switch (result) {
      Success(:final data) => UiSuccess(data),
      Error(:final failure) => UiError(failure.message),
    };
  }
}
