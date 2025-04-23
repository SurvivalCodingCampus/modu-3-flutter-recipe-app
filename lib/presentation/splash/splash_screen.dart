import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/splash/splash_action.dart';

import '../../ui/ui.dart';
import '../component/big_button.dart';

class SplashScreen extends StatelessWidget {
  final bool isButtonEnabled;
  final void Function(SplashAction action) onAction;
  const SplashScreen({
    super.key,
    required this.isButtonEnabled,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/splash_image.png',
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
                  Colors.black.withValues(alpha: 0.4),
                  ColorStyles.black, // 원하는 컬러와 투명도 조절 가능
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 66),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60 + kToolbarHeight),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/baker_hat.png',
                        width: 79,
                        height: 79,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        '100K+ Premium Recipe ',
                        style: TextStyles.mediumTextBold.copyWith(
                          color: ColorStyles.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50 + kToolbarHeight),
                  child: Column(
                    children: [
                      Text(
                        'Get\nCooking',
                        style: TextStyles.titleTextBold.copyWith(
                          color: ColorStyles.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Simple way to find Tasty Recipe',
                        style: TextStyles.normalTextRegular.copyWith(
                          color: ColorStyles.white,
                        ),
                      ),
                      const SizedBox(height: 64),
                      BigButton(
                        text: 'Start Cooking',
                        onTap:
                            isButtonEnabled
                                ? () =>
                                    onAction(const SplashAction.onTapStart())
                                : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
