import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T, E extends Exception> with _$Result<T, E> {
  const factory Result.success(T success) = Success;
  const factory Result.error(E error) = Error;
}
