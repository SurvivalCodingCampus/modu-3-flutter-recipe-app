import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/splash_screen/splash_action.dart';
import 'package:recipe_app/presentation/splash_screen/splash_event.dart';
import 'package:recipe_app/presentation/splash_screen/splash_screen.dart';
import 'package:recipe_app/presentation/splash_screen/splash_state.dart';
import 'package:recipe_app/presentation/splash_screen/splash_view_model.dart';

class SplashScreenRoot extends StatefulWidget {
  final SplashViewModel viewModel;

  const SplashScreenRoot({super.key, required this.viewModel});

  @override
  State<SplashScreenRoot> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {
  SplashViewModel get viewModel => widget.viewModel;

  SplashState get state => widget.viewModel.state;

  StreamSubscription<SplashEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.getSettings();
    bindSplashEvent();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void bindSplashEvent() {
    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowErrorMessage():
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(event.message)));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, __) {
        return SplashScreen(state: state, onAction: (SplashAction action) {
          switch (action) {
            case OnTapButton():
              context.pushReplacement(Routes.signIn);
          }
        },);
      },
    );
  }
}
