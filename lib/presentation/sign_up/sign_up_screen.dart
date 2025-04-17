import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/routes.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create an account,', style: TextFontStyle.normalBold()),
            const SizedBox(height: 5),
            SizedBox(
              width: 200,
              child: Text(
                'Let`s help you set up your account, it won`t take long.',
                style: TextFontStyle.extraSmallRegular().copyWith(height: 1.5),
              ),
            ),
            const SizedBox(height: 10),
            InputField(
              label: 'Name',
              placeholder: 'Enter Name',
              onValueChange: (value) {},
            ),
            const SizedBox(height: 5),
            InputField(
              label: 'Email',
              placeholder: 'Enter Email',
              onValueChange: (value) {},
            ),
            const SizedBox(height: 5),
            InputField(
              label: 'Enter Password',
              placeholder: 'Enter Password',
              onValueChange: (value) {},
            ),
            const SizedBox(height: 5),
            InputField(
              label: 'Confirm Password',
              placeholder: 'Retype Password',
              onValueChange: (value) {},
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 17,
                    height: 17,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: ColorStyle.secondary100,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: ColorStyle.secondary100,
                        size: 13,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Accept terms & Condition',
                    style: TextStyle(
                      color: ColorStyle.secondary100,
                      fontSize: 11,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            BigButton(text: 'Sign Up', onTap: () {}),
            const SizedBox(height: 10),
            Row(
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextFontStyle.extraSmallRegular(),
                ),
                TextButton(
                  onPressed: () {
                    context.go(Routes.signIn);
                  },
                  child: Text(
                    'Sign in',
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
