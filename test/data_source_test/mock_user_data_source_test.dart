import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';

List<Map<String, dynamic>> _userDatas = [
  {
    "id": 1,
    "name": "Chef John",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Lagos, Nigeria",
  },
  {
    "id": 2,
    "name": "Mark Kelvin",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Abuja, Nigeria",
  },
  {
    "id": 3,
    "name": "Spicy Nelly",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Ibadan, Nigeria",
  },
  {
    "id": 4,
    "name": "Kim Dahee",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Seoul, South Korea",
    "bookMarkList": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  },
  {
    "id": 5,
    "name": "Alice Johnson",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "New York, USA",
  },
  {
    "id": 6,
    "name": "Gordon Ramsay",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "London, UK",
  },
  {
    "id": 7,
    "name": "Mario Batali",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Rome, Italy",
  },
  {
    "id": 8,
    "name": "Jiro Ono",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Tokyo, Japan",
  },
  {
    "id": 9,
    "name": "Julia Child",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "Paris, France",
  },
  {
    "id": 10,
    "name": "Paul Hollywood",
    "image":
        "https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png",
    "address": "London, UK",
  },
];

void main() {
  Future<Map<String, dynamic>> getUserData(int userId) async {
    print('데이터소스 진입');
    final userData = _userDatas.firstWhere((element) {
      // print(userId);
      // print(element["id"] == userId);
      return element["id"] == userId;
    });
    print("데이터소스의 getUserData 결과 : $userData");
    return userData;
  }

  Future<void> setUserData(Map<String, dynamic> userData) async {
    final userList =
        _userDatas.where((e) => e["id"] != userData["id"]).toList();
    userList.add(userData);
    _userDatas = userList;
    print("유저 총 수 : ${_userDatas.length}");
    print("수정한 데이터 : ${_userDatas.where((element) => element["id"] == 4)}");
    return;
  }

  test('description', () {
    
  },);
}
