import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:recipe_app/presentation/splash/splash_action.dart';
import '../../ui/ui.dart';

class SplashScreen extends StatelessWidget {
  static const String hatIconImageUrl = 'assets/images/hat.png';
  static const String backgroundImageUrl = 'assets/images/splash.png';
  final void Function(SplashAction action) onAction;

  const SplashScreen({super.key, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(backgroundImageUrl, fit: BoxFit.cover),
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
                  Image.asset(hatIconImageUrl, width: 79),
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
                    onPressed: () => onAction(const SplashAction.onTapStart()),
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
