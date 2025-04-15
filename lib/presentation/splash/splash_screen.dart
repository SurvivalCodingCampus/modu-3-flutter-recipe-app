// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
// Project imports:
import 'package:recipe_app/presentation/component/custom_button.dart';

import '../../core/routing/routes.dart';

// ===== 애니메이션 타임라인 (시작 시점 기준) =====
const kBackgroundStartTime = Duration(milliseconds: 0);
const kIconStartTime = Duration(milliseconds: 300);
const kGlowTextStartTime = Duration(milliseconds: 600);
const kMainTextStartTime = Duration(milliseconds: 1800);
const kMainTextInterval = Duration(milliseconds: 80);
const kSubTextStartTime = Duration(milliseconds: 2600);
const kButtonStartTime = Duration(milliseconds: 2900);

// ===== 애니메이션 지속 시간 (duration) =====
const kGradientDuration = Duration(milliseconds: 1500);
const kIconDuration = Duration(milliseconds: 1300);
const kWiggleDuration = Duration(milliseconds: 1000);
const kGlowLoopDuration = Duration(milliseconds: 1000);
const kCharDuration = Duration(milliseconds: 500);
const kSubTextDuration = Duration(milliseconds: 600);
const kButtonDuration = Duration(milliseconds: 800);

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // 배경 애니메이션
  late final AnimationController _gradientController;
  late final Animation<double> _gradientOpacity;
  late final Animation<double> _overlayOpacity;

  // 아이콘 애니메이션
  bool _showIcon = false;
  late final AnimationController _iconController;
  late final Animation<double> _iconRotation;

  // 아이콘 지속 애니메이션
  late final AnimationController _idleWiggleController;
  late final Animation<double> _wiggle;

  // 상단 텍스트 애니메이션
  bool _showText = false;
  late final AnimationController _glowController;
  late final Animation<double> _glowAnimation;

  // 타이틀 텍스트 애니메이션
  final String _mainText = 'Get\nCooking';
  late final List<AnimationController> _charControllers;
  late final List<Animation<double>> _charOffsets;

  // 서브 텍스트 애니메이션
  late final AnimationController _subTextController;
  late final Animation<double> _subTextOpacity;
  late final Animation<double> _subTextOffset;

  // 버튼 애니메이션
  bool _showButton = false;
  late final AnimationController _buttonController;
  late final Animation<double> _buttonScale;

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  void initAnimation() {
    /// 순서 최대한 보장할 것
    _initBackgoundAnimation();
    _initIconAnimation();
    _initGlowTextAnimation();
    _initMainTextAnimation();
    _initSubTextAnimation();
    _initBottomButtonAnimation();
  }

  @override
  void dispose() {
    _gradientController.dispose();
    _iconController.dispose();
    _idleWiggleController.dispose();
    _glowController.dispose();
    for (final controller in _charControllers) {
      controller.dispose();
    }
    _subTextController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.primary100,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash_background.jpg', fit: BoxFit.cover),

          AnimatedBuilder(
            animation: _overlayOpacity,
            builder:
                (_, __) => Opacity(
                  opacity: _overlayOpacity.value,
                  child: Container(color: const Color(0x88000000)),
                ),
          ),

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorStyle.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // 애니메이션용 그라데이션 레이어
          AnimatedBuilder(
            animation: _gradientOpacity,
            builder:
                (_, __) => Opacity(
                  opacity: _gradientOpacity.value,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ),
                    ),
                  ),
                ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: _topLayout(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: _bottomLayout(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _topLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 아이콘 애니메이션 정의
        Visibility(
          visible: _showIcon,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedBuilder(
            animation: _iconRotation,
            builder: (_, child) {
              final angle = _iconRotation.value * 3.14;
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle),
                child: child,
              );
            },
            child: AnimatedBuilder(
              animation: _wiggle,
              builder:
                  (_, child) =>
                      Transform.rotate(angle: _wiggle.value, child: child),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // glow layer
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 0),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return RadialGradient(
                          center: Alignment.center,
                          radius: 0.85,
                          colors: [
                            Colors.white.withAlpha(96),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: Image.asset(
                        'assets/images/icons/icon_chief.png',
                        width: 79,
                        height: 79,
                        color: Colors.white,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                    ),
                  ),
                  // 실제 아이콘
                  Image.asset(
                    'assets/images/icons/icon_chief.png',
                    width: 79,
                    height: 79,
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 14),
        Visibility(
          visible: _showText,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedBuilder(
            animation: _glowAnimation,
            builder: (_, child) {
              return Transform.scale(scale: _glowAnimation.value, child: child);
            },
            child: Text(
              '100K+ Premium Recipe',
              style: AppTextStyles.mediumBold(color: ColorStyle.white).copyWith(
                shadows: [
                  Shadow(
                    color: Colors.white.withAlpha(128),
                    blurRadius: 12,
                    offset: Offset.zero,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(_mainText.length, (i) {
              final char = _mainText[i];

              if (char == '\n') return const SizedBox(width: double.infinity);

              return AnimatedBuilder(
                animation: _charControllers[i],
                builder:
                    (_, child) => Transform.translate(
                      offset: Offset(0, _charOffsets[i].value),
                      child: Opacity(
                        opacity:
                            1.0 - (_charOffsets[i].value / 20).clamp(0.0, 1.0),
                        child: child,
                      ),
                    ),
                child: Text(
                  char,
                  style: AppTextStyles.titleBold(color: Colors.white),
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 20),
        AnimatedBuilder(
          animation: _subTextController,
          builder:
              (_, child) => Opacity(
                opacity: _subTextOpacity.value,
                child: Transform.translate(
                  offset: Offset(0, _subTextOffset.value),
                  child: child,
                ),
              ),
          child: Text(
            'Simple way to find Tasty Recipe',
            style: AppTextStyles.normalRegular(color: ColorStyle.white),
          ),
        ),

        const SizedBox(height: 64),
        Visibility(
          visible: _showButton,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: AnimatedBuilder(
            animation: _buttonController,
            builder: (_, child) {
              return Transform.scale(scale: _buttonScale.value, child: child);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MediumButton(
                title: 'Start Cooking',
                onTap: () {
                  context.go(Routes.devHome);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _initBackgoundAnimation() {
    // 배경 애니메이션 초기화
    _gradientController = AnimationController(
      duration: kGradientDuration,
      vsync: this,
    );
    _overlayOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gradientController, curve: Curves.easeOut),
    );

    _gradientOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _gradientController, curve: Curves.easeOut),
    );
    _gradientController.forward();
  }

  void _initIconAnimation() {
    // 아이콘은 살짝 딜레이 후 등장
    Future.delayed(kIconStartTime, () {
      setState(() => _showIcon = true);
      _iconController.forward();
    });

    _iconController = AnimationController(duration: kIconDuration, vsync: this);
    _iconRotation = Tween<double>(begin: 1.4, end: 0.0).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.easeOutBack),
    );

    // 아이콘 지속 애니메이션
    _idleWiggleController = AnimationController(
      vsync: this,
      duration: kWiggleDuration,
    )..repeat(reverse: true);

    _wiggle = Tween<double>(begin: -0.03, end: 0.03).animate(
      CurvedAnimation(parent: _idleWiggleController, curve: Curves.easeInOut),
    );
  }

  void _initGlowTextAnimation() {
    _glowController = AnimationController(
      duration: kGlowLoopDuration,
      vsync: this,
    )..repeat(reverse: true); // 계속 반복

    _glowAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    Future.delayed(kGlowTextStartTime, () {
      setState(() => _showText = true);
    });
  }

  void _initMainTextAnimation() {
    // 메인 텍스트 애니메이션
    _charControllers = [];
    _charOffsets = [];

    for (int i = 0; i < _mainText.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: kCharDuration,
      );

      final offset = Tween<double>(
        begin: 20,
        end: 0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));

      _charControllers.add(controller);
      _charOffsets.add(offset);

      Future.delayed(kMainTextStartTime + kMainTextInterval * i, () {
        controller.forward();
      });
    }
  }

  void _initSubTextAnimation() {
    // 서브 텍스트 애니메이션
    _subTextController = AnimationController(
      vsync: this,
      duration: kSubTextDuration,
    );
    _subTextOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _subTextController, curve: Curves.easeOut),
    );

    _subTextOffset = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(parent: _subTextController, curve: Curves.easeOut),
    );

    // 메인 텍스트가 다 나온 후 등장
    Future.delayed(kSubTextStartTime, () {
      _subTextController.forward();
    });
  }

  void _initBottomButtonAnimation() {
    // 버튼 애니메이션
    _buttonController = AnimationController(
      vsync: this,
      duration: kButtonDuration,
    );

    _buttonScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.elasticOut),
    );

    // 서브 텍스트 나온 후, 버튼 보여주기
    Future.delayed(kButtonStartTime, () {
      setState(() => _showButton = true); // 버튼 표시
      _buttonController.forward(); // 스케일 애니메이션 시작
    });
  }
}
