import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/state_enum.dart';

class StateHandling extends StatelessWidget {
  final BaseState state;
  final Widget complete;
  const StateHandling(this.state, {required this.complete, super.key});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case BaseState.loading:
        return const Center(child: CircularProgressIndicator());
      case BaseState.error:
        return const Center(child: Text('에러가 발생하였습니다.'));
      case BaseState.moreLoading:
        return const Center(child: CircularProgressIndicator());
      case BaseState.complete:
        return complete;
    }
  }
}
