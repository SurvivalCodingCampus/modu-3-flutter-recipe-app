import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';

class MockUserDataSourceImpl implements UserDataSource{

  final List<Map<String, dynamic>> _mockUsers = [
    {
      "id": 1,
      "name": "Chef John",
      "image": "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
      "address": "Lagos, Nigeria",
      "bookmarks": [
        1, 2, 3, 4
      ]
    }
  ];

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    return _mockUsers;
  }

  @override
  Future<void> updateUser(Map<String, dynamic> updatedUser) async {
    final index = _mockUsers.indexWhere((user) => user['id'] == updatedUser['id']);
    if (index != -1) {
      _mockUsers[index] = updatedUser;
    }
  }
}