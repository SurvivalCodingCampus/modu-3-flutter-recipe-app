import 'package:recipe_app/core/enums/network_error.dart';
import 'package:recipe_app/core/result/result.dart';
import 'package:recipe_app/domain/repository/setting_repository.dart';


class MockSettingRepositoryImpl implements SettingRepository{
  final bool _isErrorSituation;

  const MockSettingRepositoryImpl({
    required bool isErrorSituation,
  }) : _isErrorSituation = isErrorSituation;

  @override
  Future<Result<String, NetworkErrorType>> getNetwork() async {
    if (_isErrorSituation == false) {
      return Result.success('네트워크 확인 완료');
    } else {
      return Result.error(NetworkErrorType.unknown);
    }
  }
}