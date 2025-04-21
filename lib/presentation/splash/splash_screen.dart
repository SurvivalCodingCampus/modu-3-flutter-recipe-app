import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/button/medium_button.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/splash_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 104),
            alignment: Alignment.center,
            child: Column(
              spacing: 14,
              children: [
                Image.asset('assets/images/chef_hat.png'),
                Text(
                  '100K+ Premium Recipe',
                  style: TextFontStyle.mediumBold(color: ColorStyle.white),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 202,
            left: 50,
            right: 50,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Get\n Cooking',
                    style: TextFontStyle.headerBold(color: ColorStyle.white),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Simple way to find Tasty Recipe',
                    style: TextFontStyle.normalRegular(color: ColorStyle.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 84,
            left: 66,
            right: 66,
            child: MediumButton(
              text: 'Start Cooking',
              onTap: () {
                context.go(Routes.signIn);
              },
            ),
          ),
        ],
      ),
    );
  }
}
