import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/pushed_button/big_tap_button.dart';
import 'package:recipe_app/presentation/first/splash_screen_view_model.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class SplashScreen extends StatefulWidget {
  final SplashScreenViewModel viewModel;

  const SplashScreen({super.key, required this.viewModel});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchApp();
    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(event.message),
            duration: const Duration(seconds: 2),
            backgroundColor: ColorStyles.primary100,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/main.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [ColorStyles.black, Colors.transparent],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/chefhat.png',
                      width: 78,
                      height: 78,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 250,
                      child: Text(
                        '100K+ Premium Recipe',
                        textAlign: TextAlign.center,
                        style: TextStyles.mediumBold.copyWith(
                          color: ColorStyles.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 300),
                    Column(
                      children: [
                        Text(
                          'Get\nCooking',
                          textAlign: TextAlign.center,
                          style: TextStyles.titleBold.copyWith(
                            color: ColorStyles.white,
                            fontSize: 50,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Simple way to find today Recipe',
                          textAlign: TextAlign.center,
                          style: TextStyles.normalRegular.copyWith(
                            color: ColorStyles.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 70),
                        BigTapButton(
                          text: 'Start Cooking',
                          onClick: () => context.go('/sign-in'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
