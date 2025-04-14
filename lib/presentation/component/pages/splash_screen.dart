import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/component/widgets/midium_button.dart';
import 'package:recipe_app/presentation/home/recipe_screen.dart';
import 'package:recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/app_text_styles.dart';
import 'package:recipe_app/ui/color_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1) 배경 이미지
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                // 본인 프로젝트의 assets에 배경 이미지를 추가 후 경로를 맞춰주세요
                image: AssetImage('assets/images/homepage.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 2) 그라데이션 오버레이 (하단부가 어둡게 처리되도록)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black45,
                  Colors.black, // 아래로 내려갈수록 어두워짐
                ],
              ),
            ),
          ),
          // 3) 콘텐츠 (텍스트, 버튼 등)
          SafeArea(
            child: Column(
              // “Start Cooking” 버튼이 화면 하단에 가깝도록 배치하기 위해
              // Column의 mainAxisAlignment를 end로 맞추어 둡니다.
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 60),
                // (선택) 중간에 일정 공간을 띄우고 싶다면 Spacer를 활용할 수도 있습니다.

                // (아이콘이나 로고가 있다면 여기에 배치)
                Image.asset(
                  'assets/images/home_icon.png',
                  width: 79,
                  height: 79,
                ),
                const SizedBox(height: 14),

                // “100K+ Premium Recipe”
                Text(
                  '100K+ Premium Recipe',
                  style: AppTextStyles.mediumBold(color: Colors.white),
                ),

                const Spacer(),

                // “Get Cooking”
                Text(
                  'Get\nCooking',
                  style: AppTextStyles.titleBold(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // “Simple way to find Tasty Recipe”
                Text(
                  'Simple way to find Tasty Recipe',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.normalRegular(color: Colors.white),
                ),
                const SizedBox(height: 64),

                MidiumButton(
                  text: 'Start Cooking',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => RecipeScreen(
                              viewModel: SavedRecipesViewModel(
                                RecipeRepositoryImpl(RecipeDataSourceImpl()),
                              ),
                            ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 84),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
