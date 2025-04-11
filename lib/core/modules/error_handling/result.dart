sealed class Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(Exception error) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  const Success(this.data);
}

class Error<T> implements Result<T> {
  final Exception error;

  const Error(this.error);
}
