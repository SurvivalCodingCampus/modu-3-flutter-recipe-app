import 'package:recipe_app/domain/repository/network_error_repository.dart';

class OffNetworkErrorRepositoryImpl implements NetworkErrorRepository {
  @override
  Future<bool> onNetworkError() async {
    return false;
  }
}
