import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/data/data_source/user_data_source.dart';

class MockUserDataSource implements UserDataSource {
  MockUserDataSource();

  // List<Map<String, dynamic>> _userDatas =

  @override
  Future<Map<String, dynamic>> getUserData(int userId) async {
    print('데이터소스 진입');
    final Map<String, dynamic> jsonMap = jsonDecode(
      await File('/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/json/mock_users.json').readAsString(),
    );
    final List jsonList = jsonMap["profiles"];
    final List<Map<String, dynamic>> userList =
        jsonList.map((e) => e as Map<String, dynamic>).toList();

    final userData = userList.firstWhere((element) {
      // print(userId);
      return element["id"] == userId;
    });
    print("데이터소스의 getUserData 결과 : $userData");
    return userData;
  }

  @override
  Future<void> setUserData(Map<String, dynamic> userData) async {
    final Map<String, dynamic> jsonMap = jsonDecode(
      await File('/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/json/mock_users.json').readAsString(),
    );
    final List jsonList = jsonMap["profiles"];
    List<Map<String, dynamic>> userDatas =
        jsonList.map((e) => e as Map<String, dynamic>).toList();

    final userList = userDatas.where((e) => e["id"] != userData["id"]).toList();
    userList.add(userData);
    userDatas = userList;
    print("유저 총 수 : ${userDatas.length}");
    print("수정한 데이터 : ${userDatas.where((element) => element["id"] == 4)}");

    final setData = {"profiles": userDatas};
    await File(
      '/Users/eastar/Documents/github/modu-3-flutter-recipe-app/assets/json/mock_users.json',
    ).writeAsString(jsonEncode(setData));
    return;
  }
}
