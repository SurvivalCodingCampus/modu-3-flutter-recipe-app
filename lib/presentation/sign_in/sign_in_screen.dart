import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/main/main_screen.dart';
import 'package:recipe_app/routes.dart';
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InputField(
                label: 'Email',
                placeholder: 'Enter Email',
                onValueChange: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InputField(
                label: 'Enter Password',
                placeholder: 'Enter Password',
                onValueChange: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextFontStyle.smallRegular(
                    color: ColorStyle.secondary100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BigButton(
                text: 'Sign In',
                onTap: () {
                  context.go(Routes.home);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'Or sign in With',
                  style: TextFontStyle.smallRegular(color: ColorStyle.gray4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.network(
                      'https://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19754.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don`t have an account?',
                  style: TextFontStyle.smallBold(),
                ),
                TextButton(
                  onPressed: () {
                    context.go(Routes.signUp);
                  },
                  child: Text(
                    'Sign up',
                    style: TextFontStyle.smallBold(
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
