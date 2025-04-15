import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_style.dart';
import 'package:recipe_app/core/ui/text_style.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/login_component/social_login_section.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
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

              const SizedBox(height: 40),

              if (showName) ...[
                const InputField(
                  labelTitle: 'Name',
                  placeholderText: 'Enter Name',
                  value: '',
                ),
                const SizedBox(height: 20),
              ],

              const InputField(
                labelTitle: 'Email',
                placeholderText: 'Enter Email',
                value: '',
              ),
              const SizedBox(height: 20),
              const InputField(
                labelTitle: 'Password',
                placeholderText: 'Enter Password',
                value: '',
              ),

              const SizedBox(height: 12),

              if (showConfirm) ...[
                const SizedBox(height: 20),
                const InputField(
                  labelTitle: 'Confirm Password',
                  placeholderText: 'Retype Password',
                  value: '',
                ),
              ],

              const SizedBox(height: 16),
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

              const SizedBox(height: 32),
              BigButton(title: isSignUp ? 'Sign Up' : 'Sign In', onTap: () {}),

              const SizedBox(height: 32),
              SocialSignInSection(
                onGoogleTap: () => debugPrint("Google tapped"),
                onFacebookTap: () => debugPrint("Facebook tapped"),
              ),

              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap: toggle,
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyles.smallRegular(color: Colors.black),
                      children: [
                        TextSpan(
                          text:
                              isSignUp
                                  ? 'Already a member? '
                                  : 'Don’t have an account? ',
                        ),
                        TextSpan(
                          text: isSignUp ? 'Sign In' : 'Sign up',
                          style: AppTextStyles.smallBold(
                            color: ColorStyle.secondary100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
