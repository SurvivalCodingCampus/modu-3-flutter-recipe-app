import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router_path.dart';
import 'package:recipe_app/presentation/component/pages/home/main_screen.dart';
import 'package:recipe_app/presentation/component/widgets/big_button.dart';
import 'package:recipe_app/presentation/component/widgets/custom_text_field.dart';
import 'package:recipe_app/ui/app_text_styles.dart';
import 'package:recipe_app/ui/color_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                'Create an account',
                style: AppTextStyles.largeBold(color: ColorStyle.black1),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 200,
                height: 44,
                child: Text(
                  'Let’s help you set up your account, it won’t take long.',
                  style: AppTextStyles.extraSmallRegular(
                    color: ColorStyle.black2,
                  ),
                  maxLines: 2, // 최대 2줄까지 줄바꿈 허용
                  softWrap: true, // 자동 줄바꿈 허용
                  overflow: TextOverflow.ellipsis, // 넘칠 경우 말줄임표로 처리
                ),
              ),

              const SizedBox(height: 20),

              // Name 입력
              Text(
                'Name',
                style: AppTextStyles.smallRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter Name'),
              const SizedBox(height: 20),

              // Email 입력
              Text(
                'Email',
                style: AppTextStyles.smallRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter Email'),
              const SizedBox(height: 20),
              Text(
                'Password',
                style: AppTextStyles.smallRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Enter Password'),
              const SizedBox(height: 20),
              Text(
                'Confirm Password',
                style: AppTextStyles.smallRegular(color: ColorStyle.black2),
              ),
              const SizedBox(height: 8),
              CustomTextField(hintText: 'Retype Password'),
              const SizedBox(height: 20),

              // 약관 동의 체크박스
              Row(
                children: [
                  Transform.scale(
                    scale: 0.85, // ⬅️ 크기 줄이기
                    child: Checkbox(
                      value: false, // 실제 체크 상태로 바꿔줘
                      onChanged: (value) {
                        // TODO: 체크 상태 변경 로직
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: const BorderSide(
                        color: ColorStyle.orange,
                        width: 1,
                      ),
                      activeColor: ColorStyle.orange, // 박스 내부 채움 색
                      checkColor: Colors.white, // 체크 표시 색
                    ),
                  ),
                  Text(
                    'Accept terms & Conditions',
                    style: AppTextStyles.extraSmallRegular(
                      color: ColorStyle.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              // Sign Up 버튼
              BigButton(
                text: 'Sign Up',
                onPressed: () {
                  context.go(RouterPath.main);
                },
              ),
              const SizedBox(height: 14),
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

              SizedBox(height: 20),

              // Sign In 텍스트
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already a member? ",
                    style: AppTextStyles.signsize(color: ColorStyle.black1),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: AppTextStyles.signsize(color: ColorStyle.orange),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                context.go(RouterPath.signIn);
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
