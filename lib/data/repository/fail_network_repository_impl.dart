import 'package:recipe_app/domain/repository/repository.dart';

class FailNetworkRepositoryImpl implements NetworkRepository {
  @override
  Future<bool> hasNetwork() async {
    return false;
  }
}
