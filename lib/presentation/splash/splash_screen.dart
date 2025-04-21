
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/splash/splash_event.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

import '../../router/routes.dart';
import '../../ui/text.dart';



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
      if (mounted) {
        switch (event) {
          case networkSuccess():
            context.go(Routes.signIn);
          case networkError():
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(event.e))
            );
        }
      }
    });
    widget.viewModel.checkNetwork();
  }


  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/splash_back_img.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(
                    height: 112,
                  ),
                  Image.asset('assets/images/splash_img.png',
                    width: 79,
                    height: 79,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '100K+ Premium Recipe',
                    style: TextStyles.mediumTextBold.copyWith(
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 270,),
                  Container(
                    width: 230,
                    // height: 120,
                    child: Text(
                      'Get CooKing',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Simple way to find Tasty Recipe',
                    style: TextStyles.normalTextRegular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  MediumButton(
                    onClick: () async {
                      final conneted = await widget.viewModel.checkNetwork();
                      if (conneted) {
                        widget.viewModel.onSuccess();
                      }
                      // widget.viewModel.onSuccess();
                      // context.go(Routes.signIn);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
