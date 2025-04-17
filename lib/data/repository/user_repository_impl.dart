import 'package:recipe_app/core/error/failure.dart';
import 'package:recipe_app/core/error/result.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/mapper/user_mapper.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;

  const UserRepositoryImpl({required this.dataSource});

  @override
  Future<Result<User>> getCurrentUser() async {
    try {
      final dto = await dataSource.getCurrentUser();
      return Result.success(dto.toUser());
    } catch (e) {
      return Result.error(Failure('유저 데이터를 불러오는 데 실패했습니다.', cause: e));
    }
  }

  @override
  Future<Result<void>> saveUser(User user) async {
    try {
      final dto = user.toDto();
      await dataSource.saveUser(dto);
      return const Result.success(null);
    } catch (e) {
      return Result.error(Failure('유저 저장 중 오류가 발생했습니다.', cause: e));
    }
  }
}
