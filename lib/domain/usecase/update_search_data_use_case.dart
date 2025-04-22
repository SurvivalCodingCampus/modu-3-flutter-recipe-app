import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/core/error/ui_state.dart';
import 'package:recipe_app/domain/repository/search_data_repository.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';

class UpdateSearchDataUseCase {
  final SearchDataRepository _repository;

  UpdateSearchDataUseCase(this._repository);

  Future<UiState<void>> execute({
    required String? query,
    required int? rate,
    required List<FilterCategory>? categories,
  }) async {
    final List<String> strCategories = [];

    if (categories != null) {
      for (final category in categories) {
        strCategories.add(category.label);
      }
    }
    final result = await _repository.updateSearchData(
      query: query,
      rate: rate,
      categories: strCategories,
    );

    return switch (result) {
      Success() => const UiState.success(null),
      Error(:final failure) => UiState.error(failure.message),
    };
  }
}
