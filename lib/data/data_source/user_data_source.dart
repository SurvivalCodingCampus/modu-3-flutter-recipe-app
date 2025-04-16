abstract interface class UserDataSource {
  Future<Map<String, dynamic>> getUserData(int userId);
  Future<void> setUserData(Map<String, dynamic> userData);
}
