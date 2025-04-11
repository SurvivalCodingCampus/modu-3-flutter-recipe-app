import 'package:flutter/material.dart';

class PageAnimationMove {
  void pushWithFade({
    required BuildContext context,
    required int second,
    required Widget page,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: second),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  void pushWithSlide({
    required BuildContext context,
    required int second,
    required Widget page,
    Offset beginOffset = const Offset(1.0, 0.0), // 오른쪽에서 들어오기
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: second),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: beginOffset,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }

  void pushWithScale({
    required BuildContext context,
    required int second,
    required Widget page,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: second),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    );
  }

  void pushWithRotation({
    required BuildContext context,
    required int second,
    required Widget page,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: second),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
      ),
    );
  }

  void pushWithSlideAndFade({
    required BuildContext context,
    required int second,
    required Widget page,
    Offset beginOffset = const Offset(0.0, 1.0), // 아래에서 위로
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: second),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, __, child) {
          final slide = Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(animation);

          return SlideTransition(
            position: slide,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
