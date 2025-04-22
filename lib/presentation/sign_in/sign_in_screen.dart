import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';

import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello,', style: TextFontStyle.headerBold()),
            Text('Welcome Back!', style: TextFontStyle.largeRegular()),
            const SizedBox(height: 40),
            InputField(
              label: 'Email',
              placeholder: 'Enter Email',
              onValueChange: (value) {},
            ),
            const SizedBox(height: 20),
            InputField(
              label: 'Enter Password',
              placeholder: 'Enter Password',
              onValueChange: (value) {},
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextFontStyle.extraSmallRegular(
                  color: ColorStyle.secondary100,
                ),
              ),
            ),
            BigButton(
              text: 'Sign In',
              onTap: () {
                context.go(Routes.home);
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 50,
                    child: Divider(thickness: 1, color: ColorStyle.gray4),
                  ),
                  Text(
                    'Or sign in With',
                    style: TextFontStyle.extraSmallRegular(
                      color: ColorStyle.gray4,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                    child: Divider(thickness: 1, color: ColorStyle.gray4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 25,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyle.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: ColorStyle.shadow,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/google_icon.png'),
                ),
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyle.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: ColorStyle.shadow,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Image.asset('assets/images/facebook_icon.png'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don`t have an account?',
                  style: TextFontStyle.extraSmallRegular(),
                ),
                TextButton(
                  onPressed: () {
                    context.go(Routes.signUp);
                  },
                  child: Text(
                    'Sign up',
                    style: TextFontStyle.extraSmallBold(
                      color: ColorStyle.secondary100,
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
