import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/splash/splash_action.dart';
import 'package:recipe_app/presentation/splash/splash_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SplashScreenRoot extends StatefulWidget {
  const SplashScreenRoot({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenRootState();
}

class _SplashScreenRootState extends State<SplashScreenRoot> {
  final connectionChecker = InternetConnectionChecker.instance;

  @override
  void initState() {
    super.initState();

    connectionChecker.onStatusChange.listen((InternetConnectionStatus status) {
      if (mounted) {
        if (status == InternetConnectionStatus.disconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('네트워크 에러'),
              showCloseIcon: true,
              duration: Duration(days: 1),
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    connectionChecker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      onAction: (action) {
        switch (action) {
          case OnTapStart():
            context.go(Routes.home);
        }
      },
    );
  }
}
