import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/core/event/setting_event.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/ingredient/splash/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  final SplashViewModel viewModel;

  const SplashScreen({super.key, required this.viewModel});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewModel.eventStream.listen((event) {
      if(mounted) {
        switch (event) {
          case NetworkError():
            final snackBar = SnackBar(content: Text(event.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/splash_images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/images/splash_images/cook_icon.png',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '100K+ Premium Recipe',
                        style: TextStyles.mediumBold(color: ColorStyles.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Get\nCooking',
                            textAlign: TextAlign.center,
                            style: TextStyles.largeBold().copyWith(
                              color: ColorStyles.white,
                              fontSize: 50,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Simple way to find Tasty Recipe',
                            textAlign: TextAlign.center,
                            style: TextStyles.normalRegular(
                              color: ColorStyles.white,
                            ),
                          ),
                        ],
                      ),
                      ButtonWidget(
                        buttonSize: ButtonSize.medium,
                        buttonText: 'Start Cooking',
                        onClick: () {
                          context.go(Routes.signIn);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
