import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

import '../../core/presentation/components/big_button.dart' show BigButton;

class SignUpScreen extends StatelessWidget {
  final VoidCallback onSignInClick;
  final VoidCallback onSignUpClick;

  const SignUpScreen({
    super.key,
    required this.onSignInClick,
    required this.onSignUpClick,
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
            Text('Create an account', style: AppTextStyles.largeBold),
            Text(
              'Let’s help you set up your account,',
              style: AppTextStyles.smallRegular,
            ),
            Text(' it won’t take long.', style: AppTextStyles.smallRegular),
            const SizedBox(height: 20),
            InputField(
              label: 'Name',
              placeHolder: 'Enter Name',
              onValueChange: (value) {},
              value: '',
            ),
            const SizedBox(height: 20),
            InputField(
              label: 'Email',
              placeHolder: 'Enter Email',
              onValueChange: (value) {},
              value: '',
            ),
            const SizedBox(height: 20),
            InputField(
              label: 'Password',
              placeHolder: 'Enter Password',
              onValueChange: (value) {},
              value: '',
            ),
            const SizedBox(height: 20),
            InputField(
              label: 'Confirm Password',
              placeHolder: 'Retype Password',
              onValueChange: (value) {},
              value: '',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: ColorStyle.secondary100,
                      width: 1,
                    ),
                  ),
                  side: const BorderSide(color: ColorStyle.secondary100),
                ),
                Text(
                  'Forgot Password?',
                  style: AppTextStyles.smallRegular.copyWith(
                    color: ColorStyle.secondary100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            BigButton(text: 'Sign Up', onClick: onSignInClick),
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
            const SizedBox(height: 20),
            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Already a memeber? ',
                  children: [
                    TextSpan(
                      text: ' Sign In',
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
