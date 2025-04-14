import 'package:flutter/material.dart';
import 'package:recipe_app/presentaiton/ui/text_styles.dart';

import '../component/buttons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/splash_background.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black,
                  ],
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Column(
            children: [
              SizedBox(height: 104),
              SizedBox(
                height: 79,
                width: 79,
                child: Image.asset('assets/icons/splash_screen_image.png'),
              ),
              SizedBox(height: 14),
              Text(
                '100K+ Premium Recipe ',
                style: TextStyles.mediumTextBold.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 222),
              Text(
                'Get\nCooking',
                textAlign: TextAlign.center,
                style: TextStyles.titleTextBold.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Simple way to find Tasty Recipe',
                style: TextStyles.normalTextRegular.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 64),
              MediumButtonsWidget(
                onClick: () {},
                buttons: Buttons(name: 'Start cooking'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
