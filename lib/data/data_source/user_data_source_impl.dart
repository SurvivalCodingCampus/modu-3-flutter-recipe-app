import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  final String path = 'assets/data/users.json';

  UserDataSourceImpl();

  @override
  Future<UserDto> getUserDto(String userName) async {
    try {
      final userDtos = await getUserDtos();
      return userDtos.firstWhere(
        (user) => user.name == userName,
        orElse: () => throw Exception('User not found'),
      );
    } catch (e) {
      throw Exception('유저 데이터를 불러오는 데 실패했습니다.');
    }
  }

  @override
  Future<List<UserDto>> getUserDtos() async {
    try {
      await Future.delayed(const Duration(microseconds: 50000));
      final jsonString = await rootBundle.loadString(path);

      final List<dynamic> usersJson = jsonDecode(jsonString);

      return usersJson.map((e) => UserDto.fromJson(e)).toList();
    } catch (e) {
      throw Exception('유저 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
