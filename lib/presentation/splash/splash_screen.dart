import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/routes.dart';
import '../component/medium_Button.dart';
import '../component/rating_dialog.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          //백그라운드 설정
          Image.asset(
            'assets/images/splash_background.jpg', // 여기에 너의 배경 이미지 경로 넣기
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),   //위는 반투명에서
                  Colors.black.withOpacity(1.0),  // 아래로 갈수록 검정 진하게
                ],
              ),
            ),
          ),


          // 콘텐츠 영역
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Column(
                  children: [
                    Image.asset(
                      'assets/images/splash_logo.png', // 로고 아이콘

                      width: 180,
                      height: 90,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '100K+ Premium Recipe',
                      style: AppTextStyles.mediumBold.copyWith(
                          color: ColorStyle.white
                      )
                    ),
                  ],
                ),
                const SizedBox(height: 290),

                // Get Cooking 타이틀
                Text(
                  'Get\nCooking',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleBold.copyWith(
                      color: ColorStyle.white
                  ),
                ),
                const SizedBox(height: 16),

                // 서브 타이틀
                Text(
                  'Simple way to find Tasty Recipe',
                  style: AppTextStyles.normalRegular.copyWith(
                      color: ColorStyle.white
                  ),
                ),
                const SizedBox(height: 60),

                // 버튼
                MediumButton(lable: 'Start Cooking',
                  onClick: () {
                    context.push(Routes.signIn);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

/*  //호출시 _showRatingDialog(context);
  Future<void> _showRatingDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero, // 여백 제거
          content: RatingDialog(
            title: "Rate recipe",
            actionName: "Send",
            onChange: (rating) {
              // 선택된 평점을 처리하는 코드
              print("선택된 평점: $rating");
              // 다이얼로그 닫기
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  } */
}