import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/button_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 150,
                horizontal: 40,
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
                          style: TextStyles2.splashScreenText,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Get',
                          style: TextStyles2.splashScreenText.copyWith(
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'Cooking',
                          style: TextStyles2.splashScreenText.copyWith(
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'Simple way to find Tasty Recipe',
                          style: TextStyles2.splashScreenText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyles2.splashScreenButton,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Start Cooking',
                                style: TextStyles2.splashScreenText.copyWith(
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
          ],
        ),
      ),
    );
  }
}
