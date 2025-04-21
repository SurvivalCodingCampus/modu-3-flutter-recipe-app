import 'package:recipe_app/domain/repository/repository.dart';

class SuccessNetworkRepositoryImpl implements NetworkRepository {
  @override
  Future<bool> hasNetwork() async {
    return true;
  }
}
