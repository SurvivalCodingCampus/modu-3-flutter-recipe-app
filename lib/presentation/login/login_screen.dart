import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
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
  bool isSignUpDisplayed = false;

  void toggle() {
    setState(() {
      final next = !isSignUp;
      isSignUp = next;
      isSignUpDisplayed = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double signInHeight = (20 * 1 + 81 * 2);
    const double signUpHeight = (20 * 3 + 81 * 4);

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 40,
            bottom: MediaQuery.of(context).viewInsets.bottom + 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 상단 텍스트 애니메이션
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
                        Text(
                          'Create Account',
                          style: AppTextStyles.largeBold(),
                        ),
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

                  // 입력 필드 영역
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(
                      begin: isSignUpDisplayed ? signInHeight : signUpHeight,
                      end: isSignUpDisplayed ? signUpHeight : signInHeight,
                    ),
                    builder: (context, height, _) {
                      return AnimatedSize(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: height),
                          child: Column(
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 100),
                                child:
                                    isSignUpDisplayed
                                        ? const Column(
                                          key: ValueKey('signUp'),
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InputField(
                                              labelTitle: 'Name',
                                              placeholderText: 'Enter Name',
                                              value: '',
                                            ),
                                            SizedBox(height: 20),
                                            InputField(
                                              labelTitle: 'Email',
                                              placeholderText: 'Enter Email',
                                              value: '',
                                            ),
                                            SizedBox(height: 20),
                                            InputField(
                                              labelTitle: 'Password',
                                              placeholderText: 'Enter Password',
                                              value: '',
                                            ),
                                            SizedBox(height: 20),
                                            InputField(
                                              labelTitle: 'Confirm Password',
                                              placeholderText:
                                                  'Retype Password',
                                              value: '',
                                            ),
                                          ],
                                        )
                                        : const Column(
                                          key: ValueKey('signIn'),
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InputField(
                                              labelTitle: 'Email',
                                              placeholderText: 'Enter Email',
                                              value: '',
                                            ),
                                            SizedBox(height: 20),
                                            InputField(
                                              labelTitle: 'Password',
                                              placeholderText: 'Enter Password',
                                              value: '',
                                            ),
                                          ],
                                        ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),
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
                    onTap: () => context.go(Routes.mainHome),
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
                            (child, animation) => FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                        child: Text.rich(
                          key: ValueKey(isSignUpDisplayed),
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
            ],
          ),
        ),
      ),
    );
  }
}
