import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/page/splash/splash_logo_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';

class SlideOverlayScreen extends StatefulWidget {
  final SplashViewModel model;
  final bool show;

  const SlideOverlayScreen({
    super.key,
    required this.show,
    required this.model,
  });

  @override
  State<SlideOverlayScreen> createState() => _SlideOverlayScreenState();
}

class _SlideOverlayScreenState extends State<SlideOverlayScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.show) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(SlideOverlayScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show != oldWidget.show) {
      if (widget.show) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.model,
      builder: (context, snapshot) {
        return SlideTransition(
          position: _offsetAnimation,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.4), // rgba(0, 0, 0, 0.4)
                      Color(0xFF000000), // #000000
                    ],
                    stops: [0.0001, 1.0], // 0.01% ≒ 0.0001, 99.99% = 1.0
                  ),
                ),
              ),
              SplashLogoScreen(
                model: widget.model,
                text:
                    '100K+'
                    ' Premium Recipe',
              ),
            ],
          ),
        );
      },
    );
  }
}
