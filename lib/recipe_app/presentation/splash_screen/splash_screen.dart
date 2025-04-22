import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen_view_model.dart';
import 'package:recipe_app/recipe_app/ui/button_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

import 'splash_screen_event.dart';

class SplashScreen extends StatefulWidget {
  final SplashScreenViewModel viewModel;

  const SplashScreen({super.key, required this.viewModel});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<SplashScreenEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case networkError():
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
          Image.asset(
            'assets/images/splash.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black38, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/cookinghat.png',
                              width: 79,
                              height: 79,
                            ),
                            SizedBox(height: 10),
                            Text(
                              '100K+ Preminum Recipe',
                              style: TextStyles.splashScreenText,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Text(
                              'Get',
                              style: TextStyles.splashScreenText.copyWith(
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              'Cooking',
                              style: TextStyles.splashScreenText.copyWith(
                                fontSize: 50,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Simple way to find Tasty Recipe',
                                style: TextStyles.splashScreenText.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () {
                                //바로 오류 출력
                                // widget.viewModel.onNetworkError();
                                context.go(Routes.signIn);
                              },
                              style: ButtonStyles.splashScreenButton,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Start Cooking',
                                    style: TextStyles.splashScreenText.copyWith(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
