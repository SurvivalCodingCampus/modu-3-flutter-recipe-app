import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/routing/router_path.dart';
import 'package:recipe_app/presentation/screen/signUp/sign_up_screen.dart';
import 'package:recipe_app/presentation/widget/big_button.dart';
import 'package:recipe_app/presentation/widget/custom_text_field.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Hello,',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Welcome Back!',
                style: AppTextStyles.largeRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 57),

              // Email 입력
              Text(
                'Email',
                style: AppTextStyles.smallRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter Email'),
              const SizedBox(height: 30),

              // Password 입력
              Text(
                'Enter Password',
                style: AppTextStyles.smallRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter Password'),
              const SizedBox(height: 20),

              // Forgot Password
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '   Forgot Password?',
                  style: AppTextStyles.extraSmallRegular(
                    color: ColorStyle.orange,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sign In 버튼
              BigButton(
                text: 'Sign In',
                onPressed: () {
                  context.go(RouterPath.main); // go_router의 경로 사용
                },
              ),

              const SizedBox(height: 28),

              // 구분선 + 텍스트
              Row(
                children: [
                  const SizedBox(width: 90), // 좌측 여백
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Or Sign in With',
                      style: AppTextStyles.signsize(color: ColorStyle.gray2),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                  const SizedBox(width: 90), // 우측 여백
                ],
              ),

              const SizedBox(height: 20),

              // 소셜 로그인 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(10), // 아이콘 안쪽 여백
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 44,
                    height: 44,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 100),

              // 회원가입 유도
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: AppTextStyles.signsize(color: ColorStyle.black1),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: AppTextStyles.signsize(color: ColorStyle.orange),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                context.go(RouterPath.signUp);
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
