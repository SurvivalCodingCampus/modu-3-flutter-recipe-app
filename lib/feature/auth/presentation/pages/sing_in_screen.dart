import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/router/routes.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/core/presentation/widgets/button/app_button.dart';
import 'package:recipe_app/core/presentation/widgets/textfield/app_textfield.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text('Hello', style: AppTextStyle.headerBold),
            Text('Welcome Back!', style: AppTextStyle.largeRegular),
            const SizedBox(height: 50),
            Text('Email', style: AppTextStyle.smallRegular),
            AppTextField(controller: _email, hintText: 'Enter email'),
            const SizedBox(height: 30),
            Text('Enter Password', style: AppTextStyle.smallRegular),
            AppTextField(controller: _password, hintText: 'Enter Password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                'Forget Password?',
                style: AppTextStyle.smallRegular.copyWith(
                  color: AppColor.secondary100,
                ),
              ),
            ),
            AppButton(
              text: 'Sign In',
              onClick: () {
                context.replace(AppRoutes.home);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 1, width: 50, color: AppColor.grey4),
                  Text(
                    ' Or Sign in With ',
                    style: AppTextStyle.smallRegular.copyWith(
                      color: AppColor.grey4,
                    ),
                  ),
                  Container(height: 1, width: 50, color: AppColor.grey4),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.boxShadow.withValues(alpha: 0.15),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.network(
                    width: 24,
                    height: 24,
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/480px-Google_%22G%22_logo.svg.png',
                  ),
                ),
                const SizedBox(width: 25),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.boxShadow.withValues(alpha: 0.15),
                        spreadRadius: 3,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.network(
                    width: 24,
                    height: 24,
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Facebook_logo_%28square%29.png/640px-Facebook_logo_%28square%29.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: AppTextStyle.smallerRegular,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    context.replace(AppRoutes.signUp);
                  },
                  child: Text(
                    'Sign up',
                    style: AppTextStyle.smallerRegular.copyWith(
                      color: AppColor.secondary100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
