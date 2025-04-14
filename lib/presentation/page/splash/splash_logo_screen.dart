import 'package:flutter/material.dart';
import 'package:recipe_app/core/common/page_animation_move.dart';
import 'package:recipe_app/presentation/common/component/color_text_button.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/page_wrapper/page_wapper.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';

class SplashLogoScreen extends StatefulWidget {
  final SplashViewModel model;
  final String text;

  const SplashLogoScreen({super.key, required this.text, required this.model});

  @override
  State<SplashLogoScreen> createState() => _SplashLogoScreenState();
}

class _SplashLogoScreenState extends State<SplashLogoScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoScale;
  late Animation<double> _logoFade;
  late AnimationController _textController;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );

    _textOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _textSlide = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _logoFade = Tween<double>(begin: 0.0, end: 1.0).animate(_logoController);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.model,
      builder: (context, snapshot) {
        if (widget.model.isOverlayVisible) {
          if (widget.model.isLogoVisible) {
            _logoController.forward().then((_) {
              if (widget.model.isTextVisible) {
                _textController.forward();
              }
            });
          }
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60 + MediaQuery.of(context).viewPadding.top),
            FadeTransition(
              opacity: _logoFade,
              child: ScaleTransition(
                scale: _logoScale,
                child: SizedBox(
                  width: 79,
                  height: 79,
                  child: Image.asset(
                    "assets/image/splash_logo"
                    ".png",
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            FadeTransition(
              opacity: _textOpacity,
              child: SlideTransition(
                position: _textSlide,
                child: Text(
                  widget.text,
                  style: AppTextStyles.mediumBold(color: ColorStyle.white),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            FadeTransition(
              opacity: _textOpacity,
              child: SlideTransition(
                position: _textSlide,
                child: Text(
                  'Get\nCooking',
                  style: AppTextStyles.headerBold(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            FadeTransition(
              opacity: _textOpacity,
              child: SlideTransition(
                position: _textSlide,
                child: Text(
                  'Simple way to find Tasty Recipe',
                  style: AppTextStyles.normalRegular(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 64),
            FadeTransition(
              opacity: _textOpacity,
              child: SlideTransition(
                position: _textSlide,
                child: Align(
                  alignment: Alignment.center,
                  child: ColorTextButton(
                    buttonHeight: 54,
                    buttonWidth: MediaQuery.of(context).size.width / 2,
                    buttonText: "Start Cooking",
                    buttonColor: ColorStyle.primary100,
                    textColor: ColorStyle.white,
                    onPressed: () {
                      PageAnimationMove().pushWithFade(
                        context: context,
                        second: 1,
                        page: PageWapper(),
                      );
                    },
                    buttonRadius: 10,
                  ),
                ),
              ),
            ),
            SizedBox(height: 84),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _logoController.dispose();
    super.dispose();
  }
}
