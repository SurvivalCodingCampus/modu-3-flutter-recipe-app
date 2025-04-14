import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/buttons.dart';
import 'package:recipe_app/presentation/example_screen/preview_main.dart';
import 'package:recipe_app/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  late AnimationController _controller2;
  late Animation<double> _logoOpacity;
  late Animation<double> _logoScale;

  bool _goPreviewMain = false;
  final bool _goSavedRecipes = false;

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 확대
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();
    // 1.0 → 1.2 (조금 확대되는 정도)
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller);
    // 애니메이션 실행 -> 완료 후 반대로 실행
    _controller.forward().then((_) => _controller.repeat(reverse: true));

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _logoOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeIn));
    _logoScale = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeOutBack));

    _controller2.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지 줌 인 애니메이션
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              );
            },
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorStyle.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // 콘텐츠
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 상단
                  Column(
                    children: [
                      FadeTransition(
                        opacity: _logoOpacity,
                        child: ScaleTransition(
                          scale: _logoScale,
                          child: Image.asset(
                            'assets/images/splash_icon.png',
                            width: 79,
                            height: 79,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                      Text(
                        '100K+ Premium Recipe',
                        style: AppTextStyles.mediumBold(
                          color: ColorStyle.white,
                        ),
                      ),
                    ],
                  ),

                  // 중앙 텍스트
                  Column(
                    children: [
                      Text(
                        'Get',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          height: 1.2, // 줄 높이
                          color: ColorStyle.white,
                        ),
                      ),
                      Text(
                        'Cooking',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          height: 1.2, // 줄 높이
                          color: ColorStyle.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Simple way to find Tasty Recipe',
                        style: AppTextStyles.normalRegular(
                          color: ColorStyle.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      children: [
                        Buttons(
                          text: 'Start Cooking',
                          icon: Icons.arrow_forward,
                          size: ButtonSize.medium,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SavedRecipesScreen(
                                      viewModel: SavedRecipesViewModel(
                                        recipeRepository: RecipeRepositoryImpl(
                                          dataSource: RecipeDataSourceImpl(),
                                        ),
                                      )..fetchSavedRecipe(),
                                    ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreviewMain(),
                              ),
                            );
                          },
                          onTapDown: (_) {
                            setState(() {
                              _goPreviewMain = true;
                            });
                          },
                          onTapUp: (_) {
                            setState(() {
                              _goPreviewMain = false;
                            });
                          },
                          onTapCancel: () {
                            setState(() {
                              _goPreviewMain = false;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.admin_panel_settings,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '레시피 UI 컴포넌트 보기',
                                style: TextStyle(
                                  color: Colors.white,
                                  decoration:
                                      _goPreviewMain
                                          ? TextDecoration.underline
                                          : TextDecoration.none,
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
          ),
        ],
      ),
    );
  }
}
