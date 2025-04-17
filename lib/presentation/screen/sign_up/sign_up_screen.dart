import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/core/component/buttons.dart';
import 'package:recipe_app/core/component/input_field.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

bool _isChecked = false;

class _SignUpScreenState extends State<SignUpScreen> {
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
                      'Create an account',
                      style: AppTextStyles.largeBold(color: ColorStyle.black),
                    ),
                    Text(
                      'Let’s help you set up your account,\nit won’t take long.',
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InputField(
                  label: 'Name',
                  placeHolder: 'Enter Name',
                  value: '',
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 16),
                InputField(
                  label: 'Email',
                  placeHolder: 'Enter Email',
                  value: '',
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 16),
                InputField(
                  label: 'Enter Password',
                  placeHolder: 'Enter Password',
                  isPassword: true,
                  value: '',
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 16),
                InputField(
                  label: 'Comfirm Password',
                  placeHolder: 'Retype Password',
                  value: '',
                  isPassword: true,
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked; // 체크 상태를 토글
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: ColorStyle.secondary100,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color:
                              _isChecked
                                  ? Color.fromARGB(
                                    255,
                                    255,
                                    165,
                                    0,
                                  ) // 활성화 시 배경색
                                  : Colors.white, // 비활성화 시 배경색
                        ),
                        width: 20,
                        height: 20,
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Accept terms & Condition",
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.secondary100,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Buttons(
                  text: 'Sign Up',
                  onPressed: () {},
                  size: ButtonSize.big,
                  icon: Icons.arrow_forward,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50, // Divider의 고정 너비 설정
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
                      width: 50, // Divider의 고정 너비 설정
                      child: Divider(thickness: 1, color: Colors.grey.shade300),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Icon GestureDetector
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
                        ), // 아이콘만 표시
                      ),
                    ),
                    const SizedBox(width: 20),

                    // Facebook Icon GestureDetector
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
                        child: Image.asset('assets/images/facebook.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up Link(GestureDetector)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member? ",
                      style: AppTextStyles.smallRegular(
                        color: ColorStyle.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.replace(Routes.signIn);
                      },
                      child: Text(
                        "Sign In",
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
