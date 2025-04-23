import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/splash/splash_action.dart';
import 'package:recipe_app/presentation/splash/splash_event.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

import '../../core/routing/routes.dart';

class SplashScreenRoot extends StatefulWidget {
  final SplashViewModel viewModel;
  const SplashScreenRoot({super.key, required this.viewModel});

  @override
  State<SplashScreenRoot> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {
  StreamSubscription<SplashEvent>? _subscription;
  bool _isButtonEnabled = true;

  @override
  void initState() {
    super.initState();

    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowNetworkError():
            setState(() {
              _isButtonEnabled = false;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('네트워크 오류입니다')));
            break;
        }
      }
    });

    widget.viewModel.fetchNetwork();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, snapshot) {
          return SplashScreen(
            isButtonEnabled: _isButtonEnabled,
            onAction: (SplashAction action) {
              switch (action) {
                case OnTapStart():
                  context.go(Routes.signIn);
              }
            },
          );
        },
      ),
    );
  }
}
