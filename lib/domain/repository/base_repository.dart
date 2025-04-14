import 'package:recipe_app/utils/result/result.dart';

abstract interface class BaseRepository<T, E extends Exception> {
  Future<Result<List<T>, E>> findDatas();
}
