import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterTransitions {
  static CustomTransitionPage fade({required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage slide({
    required GoRouterState state,
    required Widget child,
    Offset beginOffset = const Offset(1.0, 0.0),
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (_, animation, __, child) {
        final slide = Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(animation);

        return SlideTransition(
          position: slide,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage scale({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (_, animation, __, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage rotation({
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (_, animation, __, child) {
        return RotationTransition(
          turns: animation,
          child: child,
        );
      },
    );
  }

  static CustomTransitionPage slideFade({
    required GoRouterState state,
    required Widget child,
    Offset beginOffset = const Offset(0.0, 1.0),
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
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
    );
  }
}
