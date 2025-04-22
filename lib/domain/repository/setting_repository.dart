import 'package:recipe_app/core/enums/network_error.dart';
import 'package:recipe_app/core/result/result.dart';

abstract class SettingRepository {
  Future<Result<String, NetworkErrorType>> getNetwork();
}