import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/dto/user_dto.dart';

class UserDataSourceImpl implements UserDataSource {
  final String path = 'assets/data/user.json';

  UserDataSourceImpl();

  @override
  Future<UserDto> getUserDto() async {
    try {
      await Future.delayed(const Duration(microseconds: 50000));
      final jsonString = await rootBundle.loadString(path);
      return UserDto.fromJson(jsonDecode(jsonString));
    } catch (e) {
      throw Exception('User 데이터를 불러오는 데 실패했습니다.');
    }
  }
}
