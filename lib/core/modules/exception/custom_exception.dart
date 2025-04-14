abstract class CustomException {
  final int code;
  final String message;

  const CustomException(this.code, this.message);
}

class NetworkException extends CustomException {
  const NetworkException() : super(500, '에러가 발생하였습니다.');
}
