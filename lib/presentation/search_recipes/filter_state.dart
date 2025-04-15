import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
abstract class FilterState with _$FilterState {
  const factory FilterState({
    @Default('All') String time,
    @Default('5') String rate,
    @Default('All') String category,
  }) = _FilterState;
}
