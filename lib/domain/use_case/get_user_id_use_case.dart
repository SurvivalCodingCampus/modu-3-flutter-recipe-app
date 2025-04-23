class GetUserIdUseCase {
  Future<int> execute() async {
    await Future.delayed(Duration(seconds: 1));
    return 4;
  }
}
