// Flutter imports:
import 'package:flutter/foundation.dart';
// Package imports:
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/model/recipe.dart';

void main() {
  group('RecipeRepositoryImpl', () {
    test('remote success → returns Result.success', () async {
      final repo = RecipeRepositoryImpl(
        remoteDataSource: MockSuccessDataSourceImpl(),
        localDataSource: MockFailDataSourceImpl(),
      );

      final result = await repo.getRecipes();
      expect(result, isA<Success<List<Recipe>>>());

      switch (result) {
        case Success(data: final data):
          debugPrint('✅ remote success: ${data.length}개의 레시피');
          for (final r in data) {
            debugPrint('- ${r.id}: ${r.name} by ${r.chef}');
          }
          break;

        case Error(failure: final failure):
          debugPrint('❌ 예상과 다르게 실패 발생: ${failure.message}');
          fail('예상은 성공인데 실패가 반환됨');
      }
    });

    test('remote fail, local success → returns Result.success', () async {
      final repo = RecipeRepositoryImpl(
        remoteDataSource: MockFailDataSourceImpl(),
        localDataSource: MockSuccessDataSourceImpl(),
      );

      final result = await repo.getRecipes();
      expect(result, isA<Success<List<Recipe>>>());

      switch (result) {
        case Success(data: final data):
          debugPrint('✅ local fallback success: ${data.length}개의 레시피');
          for (final r in data) {
            debugPrint('- ${r.id}: ${r.name} by ${r.chef}');
          }
          break;

        case Error(failure: final failure):
          debugPrint('❌ 예상과 다르게 실패 발생: ${failure.message}');
          fail('예상은 성공인데 실패가 반환됨');
      }
    });

    test('both remote and local fail → returns Result.error', () async {
      final repo = RecipeRepositoryImpl(
        remoteDataSource: MockFailDataSourceImpl(),
        localDataSource: MockFailDataSourceImpl(),
      );

      final result = await repo.getRecipes();
      expect(result, isA<Error<List<Recipe>>>());

      switch (result) {
        case Success(data: final data):
          debugPrint('❌ 예상과 다르게 성공됨: ${data.length}개');
          fail('예상은 실패인데 성공이 반환됨');

        case Error(failure: final failure):
          debugPrint('✅ 실패 처리 확인됨: ${failure.message}');
          expect(failure.message, contains('레시피 데이터를 불러오는 데 실패'));
      }
    });
  });
}
