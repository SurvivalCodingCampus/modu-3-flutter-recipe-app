import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:recipe_app/core/platform/json_storage.dart';
import 'package:recipe_app/core/platform/json_storage_key.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/dto/user_dto.dart';

class MockUserDataSource implements UserDataSource {
  static const String assetPath = 'assets/data/user.json';

  @override
  Future<UserDto> getCurrentUser() async {
    try {
      final loaded = await JsonStorage.load(JsonStorageKey.user);
      final json = loaded ?? await _loadFromAssets();

      if (json == null) {
        throw MockUserDataSourceException('user.json 데이터가 null입니다.');
      }

      return UserDto.fromJson(json);
    } catch (e) {
      throw MockUserDataSourceException('user.json 로드 실패', cause: e);
    }
  }

  Future<Map<String, dynamic>?> _loadFromAssets() async {
    final assetStr = await rootBundle.loadString(assetPath);
    final decoded = jsonDecode(assetStr);
    if (decoded is Map<String, dynamic>) {
      await JsonStorage.save(JsonStorageKey.user, decoded);
      return decoded;
    }
    return null;
  }

  @override
  Future<void> saveUser(UserDto user) async {
    try {
      await JsonStorage.save(JsonStorageKey.user, user.toJson());
    } catch (e) {
      throw MockUserDataSourceException('user.json 저장 실패', cause: e);
    }
  }
}

class MockUserDataSourceException implements Exception {
  final String message;
  final Object? cause;

  MockUserDataSourceException(this.message, {this.cause});

  @override
  String toString() {
    return 'MockUserDataSourceException: $message'
        '${cause != null ? '\nCaused by: $cause' : ''}';
  }
}
