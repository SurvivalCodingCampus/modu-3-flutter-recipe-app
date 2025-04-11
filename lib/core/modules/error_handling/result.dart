import 'package:recipe_app/core/modules/exception/custom_exception.dart';

sealed class Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(CustomException error) = Error;
}

class Success<T> implements Result<T> {
  final T data;

  const Success(this.data);
}

class Error<T> implements Result<T> {
  final CustomException error;

  const Error(this.error);
}
