import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../ui/ui.dart';

class SplashScreen extends StatefulWidget {
  static const String hatIconImageUrl = 'assets/images/hat.png';
  static const String backgroundImageUrl = 'assets/images/splash.png';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              SplashScreen.backgroundImageUrl,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorStyles.black.withAlpha(0),
                    ColorStyles.black.withAlpha(255),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: kToolbarHeight,
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(SplashScreen.hatIconImageUrl, width: 79),
                  const SizedBox(height: 14),
                  Text(
                    '100K+ Premium Recipe',
                    style: TextStyles.mediumTextBold.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Get\nCooking',
                    textAlign: TextAlign.center,
                    style: TextStyles.titleTextBold.copyWith(
                      color: ColorStyles.white,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    'Simple way to find Tasty Recipe',
                    style: TextStyles.normalTextRegular.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const SizedBox(height: 60),
                  BigButton(
                    text: 'Start Cooking',
                    onPressed: () {
                      context.go(Routes.login);
                    },
                  ),
                  const SizedBox(height: 84),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
