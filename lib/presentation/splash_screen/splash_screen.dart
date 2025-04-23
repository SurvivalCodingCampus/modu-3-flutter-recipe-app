import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/components/f_medium_button.dart';
import 'package:recipe_app/presentation/splash_screen/splash_action.dart';
import 'package:recipe_app/presentation/splash_screen/splash_event.dart';
import 'package:recipe_app/presentation/splash_screen/splash_state.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SplashScreen extends StatefulWidget {
  final SplashState state;
  final void Function(SplashAction action) onAction;

  const SplashScreen({super.key, required this.state, required this.onAction});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/splash_background.jpeg',
                fit: BoxFit.cover,
              ),
            ),

            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),

            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 104),
                  Image.asset('assets/images/logo.png', width: 79, height: 79),
                  const SizedBox(height: 14),
                  Text(
                    '100K+ Premium Recipe',
                    style: TextStyles.mediumTextBold(),
                  ),
                  const Spacer(),
                  Text(
                    'Get\nCooking',
                    textAlign: TextAlign.center,
                    style: TextStyles.custom(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Simple way to find Tasty Recipe',
                    style: TextStyles.normalTextRegular(),
                  ),

                  const SizedBox(height: 64),

                  FMediumButton(
                    text: 'Start Cooking',
                    voidCallback: () {
                      widget.onAction(OnTapButton());
                    },
                  ),

                  const SizedBox(height: 84),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
