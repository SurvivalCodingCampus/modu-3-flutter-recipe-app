import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/image/app_image.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/home/home_screen.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      isSafeArea: false,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImage.splashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(AppImage.splashIcon),
              Text(
                '100K+ Premium Recipe',
                style: AppTextStyle.mediumBold.copyWith(color: AppColor.white),
              ),
              const Spacer(),
              Text(
                'Get\nCooking',
                style: AppTextStyle.titleBold.copyWith(color: AppColor.white),
                textAlign: TextAlign.center,
              ),
              Text(
                'Simple way to find Tasty Recipe',
                style: AppTextStyle.normalRegular.copyWith(
                  color: AppColor.white,
                ),
              ),
              const SizedBox(height: 64),
              AppButton(
                text: 'Start Cooking',
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                type: ButtonType.medium,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
