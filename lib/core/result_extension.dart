import 'package:recipe_app/core/result.dart';

extension ResultExtension<T, E> on Result<T, E> {
  void handle({
    required void Function(T data) onSuccess,
    required void Function(E error) onError,
  }) {
    switch (this) {
      case Success(:final data):
        onSuccess(data);
      case Failure(:final error):
        onError(error);
    }
  }
}
