import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_event.freezed.dart';

@freezed
sealed class FilterSearchEvent<T> with _$FilterSearchEvent<T> {
  const factory FilterSearchEvent.success(T data) = Success;

  const factory FilterSearchEvent.showErrorMessage(String message) =
      ShowErrorMessage;
}
