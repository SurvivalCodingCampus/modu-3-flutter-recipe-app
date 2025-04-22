import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/page/splash/slide_overlay_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_event.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  final SplashViewModel splashViewModel;

  const SplashScreen({super.key, required this.splashViewModel});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  StreamSubscription<SplashEvent>? _subscription;



  @override
  void initState() {
    super.initState();
    _subscription = widget.splashViewModel.eventStream.listen((event) {
      switch(event) {
        case ShowErrorMessage() :
          const snackBar = SnackBar(content: Text('인터넷이 연결 되지 않았습니다!'));
          if(mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.splashViewModel,
      builder: (context, child) {
        final state = widget.splashViewModel.state;

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedOpacity(
                opacity: state.isBackGroundVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  'assets/image/splash_background.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SlideOverlayScreen(
                show: state.isOverlayVisible,
                model: widget.splashViewModel,
              ),
            ],
          ),
        );
      },
    );
  }
}
