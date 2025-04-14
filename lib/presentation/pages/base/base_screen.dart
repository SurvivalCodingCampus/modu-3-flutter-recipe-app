import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final bool resizeToAvoidBottomInset;
  final FloatingActionButton? floatingActionButton;
  final bool isSafeArea;
  const BaseScreen({
    required this.child,
    this.bgColor = Colors.white,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = false,
    this.appBar,
    this.floatingActionButton,
    this.isSafeArea = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 텍스트 필드에서 바깥 영역 터치시 해제가 되도록 설정
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        backgroundColor: bgColor,
        body: isSafeArea ? SafeArea(child: child) : child,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
