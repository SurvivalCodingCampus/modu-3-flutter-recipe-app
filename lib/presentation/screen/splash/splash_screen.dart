import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/routing/router_path.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/presentation/event/ui_event.dart';
import 'package:recipe_app/presentation/screen/splash/splash_view_model.dart';
import 'package:recipe_app/presentation/widget/midium_button.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late final SplashViewModel _viewModel;
  late final StreamSubscription _subscription;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _viewModel = SplashViewModel();
    _viewModel.checkNetwork();

    _subscription = _viewModel.eventStream.listen((event) {
      if (event is ShowSnackBar) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(event.message)));
      }
    });

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeIn));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _subscription.cancel();
    _viewModel.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. 배경 이미지
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homepage.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. 그라데이션 오버레이
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black45, Colors.black],
              ),
            ),
          ),

          // 3. 콘텐츠
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 60),

                SlideTransition(
                  position: _slideAnimation,
                  child: Image.asset(
                    'assets/images/home_icon.png',
                    width: 79,
                    height: 79,
                  ),
                ),

                const SizedBox(height: 14),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    '100K+ Premium Recipe',
                    style: AppTextStyles.mediumBold(color: Colors.white),
                  ),
                ),

                const Spacer(),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Get\nCooking',
                    style: AppTextStyles.titleBold(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    'Simple way to find Tasty Recipe',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.normalRegular(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 64),

                SlideTransition(
                  position: _slideAnimation,
                  child: MidiumButton(
                    text: 'Start Cooking',
                    onPressed: () {
                      context.go(RouterPath.signIn);
                    },
                  ),
                ),

                const SizedBox(height: 84),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
