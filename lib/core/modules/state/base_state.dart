// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:recipe_app/core/enum/state_enum.dart';

class ListBaseState<T> {
  final List<T> _data;
  final ViewState viewState;

  // 외부에서 리스트 변경이 안되도록 설정
  List<T> get data => List.unmodifiable(_data);

  const ListBaseState({
    List<T> data = const [],
    this.viewState = ViewState.loading,
  }) : _data = data;

  ListBaseState<T> copyWith({List<T>? data, ViewState? viewState}) {
    return ListBaseState<T>(
      data: data ?? _data,
      viewState: viewState ?? this.viewState,
    );
  }
}
