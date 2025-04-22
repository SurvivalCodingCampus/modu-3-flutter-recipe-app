import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';
import 'package:recipe_app/utils/ui_event/ui_event.dart';

import '../../core/presentation/components/medium_button.dart'
    show MediumButton;

class SplashScreen extends StatefulWidget {
  final SplashViewModel viewModel;
  final VoidCallback onStartCooking;
  const SplashScreen({
    super.key,
    required this.onStartCooking,
    required this.viewModel,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case NetworkError():
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(event.message)));
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
      body: Container(
        padding: const EdgeInsets.all(0),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 104),
            Image.asset('assets/images/splash_icon.png'),
            const SizedBox(height: 14),
            Text(
              '100K+ Premium Recipe ',
              style: AppTextStyles.mediumBold.copyWith(color: ColorStyle.white),
            ),
            const Spacer(),
            Text(
              "Get",
              style: AppTextStyles.headerBold.copyWith(
                fontSize: 50,
                color: ColorStyle.white,
              ),
            ),
            Text(
              "Cooking",
              style: AppTextStyles.headerBold.copyWith(
                fontSize: 50,
                color: ColorStyle.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Simple way to find Tasty Recipe",
              style: AppTextStyles.normalRegular.copyWith(
                color: ColorStyle.white,
              ),
            ),
            const SizedBox(height: 64),
            MediumButton(text: "Start Cooking", onClick: widget.onStartCooking),
            const SizedBox(height: 84),
          ],
        ),
      ),
    );
  }
}
