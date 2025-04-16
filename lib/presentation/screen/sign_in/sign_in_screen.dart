import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/buttons.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: AppTextStyles.headerBold(color: ColorStyle.black),
                    ),
                    Text(
                      'Welcome Back!',
                      style: AppTextStyles.largeRegular(
                        color: ColorStyle.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                InputField(
                  label: 'Email',
                  placeHolder: 'Enter Email',
                  value: '',
                  onValueChange: (value) {
                    print("Email changed: $value");
                  },
                ),
                const SizedBox(height: 24),
                InputField(
                  label: 'Enter Password',
                  placeHolder: 'Enter Password',
                  value: '',
                  isPassword: true,
                  onValueChange: (value) {
                    print("Password changed: $value");
                  },
                ),
                const SizedBox(height: 8),

                // Forgot Password GestureDetector
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      print('Forgot Password tapped');
                      // Forgot Password 로직 추가 가능
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                      ), // 터치 영역 확장
                      child: Text(
                        "Forgot Password?",
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.secondary100,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Buttons(
                  text: 'Sign In',
                  onPressed: () {
                    context.go(Routes.home);
                  },
                  size: ButtonSize.big,
                  icon: Icons.arrow_forward,
                ),
                const SizedBox(height: 24),

                // Or Sign In Text with Dividers
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Divider(thickness: 1, color: Colors.grey.shade300),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Or Sign in With',
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.gray4,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 50,
                      child: Divider(thickness: 1, color: Colors.grey.shade300),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Social Media Sign-In Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Google sign-in clicked');
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1A696969),
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/google.png',
                        ), // Google 아이콘
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        print('Facebook sign-in clicked');
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1A696969),
                              offset: Offset(0, 0),
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/facebook.png',
                        ), // Facebook 아이콘
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up Link using GestureDetector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.signUp); // 회원가입 페이지로 이동
                      },
                      child: Text(
                        "Sign Up",
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.secondary100,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
