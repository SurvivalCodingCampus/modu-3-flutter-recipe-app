import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/big_button.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onSignUpClick;
  final VoidCallback onSignInClick;
  const SignInScreen({
    super.key,
    required this.onSignUpClick,
    required this.onSignInClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,', style: AppTextStyles.headerBold),
            Text('Welcome Back!,', style: AppTextStyles.largeRegular),
            const SizedBox(height: 57),
            InputField(
              label: 'Email',
              placeHolder: 'Enter Email',
              onValueChange: (value) {},
              value: '',
            ),
            const SizedBox(height: 30),
            InputField(
              label: 'Enter Password',
              placeHolder: 'Enter Password',
              onValueChange: (value) {},
              value: '',
            ),
            const SizedBox(height: 20),
            Text(
              'Forgot Password?',
              style: AppTextStyles.smallRegular.copyWith(
                color: ColorStyle.secondary100,
              ),
            ),
            const SizedBox(height: 25),
            BigButton(text: 'Sign In', onClick: onSignInClick),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 50, height: 1, color: ColorStyle.gray4),
                const SizedBox(width: 7),
                Text(
                  'Or Sign in With',
                  style: AppTextStyles.smallBold.copyWith(
                    color: ColorStyle.gray4,
                  ),
                ),
                const SizedBox(width: 7),
                Container(width: 50, height: 1, color: ColorStyle.gray4),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    'assets/images/google.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 25),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    'assets/images/facebook.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Don’t have an account?',
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: AppTextStyles.smallBold.copyWith(
                        color: ColorStyle.secondary100,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = onSignUpClick,
                    ),
                  ],
                  style: AppTextStyles.smallBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
