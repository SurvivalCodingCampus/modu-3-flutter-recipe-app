import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/state_enum.dart';

class StateHandling extends StatelessWidget {
  final ViewState viewState;
  final Widget complete;
  const StateHandling(this.viewState, {required this.complete, super.key});

  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case ViewState.loading:
        return const Center(child: CircularProgressIndicator());
      case ViewState.error:
        return const Center(child: Text('에러가 발생하였습니다.'));
      case ViewState.moreLoading:
        return const Center(child: CircularProgressIndicator());
      case ViewState.complete:
        return complete;
    }
  }
}
