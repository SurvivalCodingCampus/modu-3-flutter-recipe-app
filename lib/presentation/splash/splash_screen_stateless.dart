// Flutter imports:
import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
// Project imports:
import 'package:recipe_app/presentation/component/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.primary100,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash_background.jpg', fit: BoxFit.cover),
          Container(color: const Color(0x88000000)),

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorStyle.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: _topLayout(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: _bottomLayout(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/icons/icon_chief.png',
          width: 79,
          height: 79,
        ),
        const SizedBox(height: 14),
        Text(
          '100K+ Premium Recipe',
          style: AppTextStyles.mediumBold(color: ColorStyle.white),
        ),
      ],
    );
  }

  Widget _bottomLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Get\nCooking',
          textAlign: TextAlign.center,
          style: AppTextStyles.titleBold(),
        ),
        const SizedBox(height: 20),
        Text(
          'Simple way to find Tasty Recipe',
          style: AppTextStyles.normalRegular(color: ColorStyle.white),
        ),
        const SizedBox(height: 64),
        MediumButton(
          title: 'Start Cooking',
          onTap: () {
            debugPrint('Start Cooking!!');
          },
        ),
      ],
    );
  }
}
