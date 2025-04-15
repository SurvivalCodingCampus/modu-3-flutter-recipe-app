import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/login_component/divider_with_text.dart';
import 'package:recipe_app/presentation/component/login_component/social_login_button.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignUp = false;
  bool isSignUpDisplayed = false; // 화면에 보여지는 상태
  bool showName = false;
  bool showConfirm = false;
  bool showTerms = false;
  bool showLoginTitle = true;

  void toggle() async {
    if (!isSignUp) {
      setState(() {
        isSignUp = true;
        showLoginTitle = false;
      });

      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => showName = true);

      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        showConfirm = true;
        isSignUpDisplayed = true; // ← 여기를 confirm과 함께 조기 적용
      });

      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => showTerms = true);
    } else {
      setState(() {
        showTerms = false;
        isSignUpDisplayed = false;
      });

      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => showConfirm = false);

      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => showName = false);

      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        isSignUp = false;
        showLoginTitle = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 100),
                  crossFadeState:
                      isSignUpDisplayed
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  firstChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,', style: AppTextStyles.headerBold()),
                      Text(
                        'Welcome Back!',
                        style: AppTextStyles.largeRegular(
                          color: ColorStyle.labelColour,
                        ),
                      ),
                    ],
                  ),
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create Account', style: AppTextStyles.largeBold()),
                      const SizedBox(height: 5),
                      Text(
                        'Let’s help you set up your account,\nit won’t take long.',
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.labelColour,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 57),

                if (showName) ...[
                  const InputField(
                    labelTitle: 'Name',
                    placeholderText: 'Enter Name',
                    value: '',
                    height: 55,
                  ),
                  SizedBox(height: isSignUpDisplayed ? 20 : 30),
                ],

                const InputField(
                  labelTitle: 'Email',
                  placeholderText: 'Enter Email',
                  value: '',
                ),
                SizedBox(height: isSignUpDisplayed ? 20 : 30),
                const InputField(
                  labelTitle: 'Password',
                  placeholderText: 'Enter Password',
                  value: '',
                ),

                if (showConfirm) ...[
                  SizedBox(height: isSignUpDisplayed ? 20 : 30),
                  const InputField(
                    labelTitle: 'Confirm Password',
                    placeholderText: 'Retype Password',
                    value: '',
                  ),
                ],

                const SizedBox(height: 20),
                // if (showTerms)
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 100),
                  crossFadeState:
                      isSignUpDisplayed
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  firstChild: Text(
                    'Forgot Password?',
                    style: AppTextStyles.smallRegular(
                      color: ColorStyle.secondary100,
                    ),
                  ),
                  secondChild: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (_) {},
                        activeColor: ColorStyle.secondary100,
                      ),
                      Text(
                        'Accept terms & Condition',
                        style: AppTextStyles.smallRegular(
                          color: ColorStyle.secondary100,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                BigButton(
                  title: isSignUp ? 'Sign Up' : 'Sign In',
                  onTap: () {},
                ),

                const SizedBox(height: 32),

                Column(
                  children: [
                    const DividerWithText(text: 'Or Sign in With'),
                    SizedBox(height: isSignUpDisplayed ? 20 : 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLoginButton(
                          imagePath: 'assets/images/icons/icon_google.png',
                          onTap: () {},
                        ),
                        const SizedBox(width: 24),
                        SocialLoginButton(
                          imagePath: 'assets/images/icons/icon_facebook.png',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: isSignUpDisplayed ? 55 : 20),
                Center(
                  child: GestureDetector(
                    onTap: toggle,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      transitionBuilder:
                          (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                      child: Text.rich(
                        key: ValueKey(isSignUpDisplayed), // ✅ 타이틀 애니메이션 기준에 맞춤
                        TextSpan(
                          style: AppTextStyles.smallRegular(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  isSignUpDisplayed
                                      ? 'Already a member? '
                                      : 'Don’t have an account? ',
                            ),
                            TextSpan(
                              text: isSignUpDisplayed ? 'Sign In' : 'Sign up',
                              style: AppTextStyles.smallBold(
                                color: ColorStyle.secondary100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
