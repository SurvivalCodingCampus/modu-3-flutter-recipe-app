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
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create an account,', style: TextFontStyle.normalBold()),
            SizedBox(
              width: 200,
              child: Text(
                'Let`s help you set up your account, it won`t take long.',
                style: TextFontStyle.extraSmallRegular(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InputField(
                label: 'Name',
                placeholder: 'Enter Name',
                onValueChange: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InputField(
                label: 'Email',
                placeholder: 'Enter Email',
                onValueChange: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InputField(
                label: 'Enter Password',
                placeholder: 'Enter Password',
                onValueChange: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: InputField(
                label: 'Confirm Password',
                placeholder: 'Retype Password',
                onValueChange: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {},
                value: false,
                title: Text(
                  'Accept terms & Condition',
                  style: TextFontStyle.smallRegular(
                    color: ColorStyle.secondary100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: BigButton(text: 'Sign Up', onTap: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Center(
                child: Text(
                  'Or sign in With',
                  style: TextFontStyle.smallRegular(color: ColorStyle.gray4),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
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
                Text('Already a member?', style: TextFontStyle.smallBold()),
                TextButton(
                  onPressed: () {
                    context.go(Routes.signIn);
                  },
                  child: Text(
                    'Sign in',
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
