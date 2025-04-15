import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/announce_line.dart';
import 'package:recipe_app/presentation/main/sign_up/sign_up_view_model.dart';

import '../../../ui/color_styles.dart';
import '../../../ui/text_styles.dart';
import '../../component/accept_button.dart';
import '../../component/big_button.dart';
import '../../component/input_field.dart';
import '../../component/social_icon.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, required this.viewModel});

  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80, left: 30),
              child: SizedBox(
                width: 210,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyles.largeBold.copyWith(fontSize: 25),
                    ),
                    Text(
                      "Let's help you set up your account, \nit won't take long.",
                      style: TextStyles.smallerRegular.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            InputField(
              label: 'Name',
              holder: 'Enter Name',
              onChanged: (value) {
                viewModel.updateName(value);
              },
            ),
            InputField(
              label: 'Email',
              holder: 'Enter Email',
              onChanged: (value) {
                viewModel.updateEmail(value);
              },
            ),
            InputField(
              label: 'Password',
              holder: 'Enter Password',
              onChanged: (value) {
                viewModel.updatePassword(value);
              },
            ),
            InputField(
              label: 'Confirm Password',
              holder: 'Retype Password',
              onChanged: (value) {
                viewModel.confirmPassword(value);
              },
            ),
            AcceptButton(text: 'Accept terms & Condition'),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: BigButton(
                text: 'Sign Up',
                onClick:
                    viewModel.state.isValid
                        ? () {
                          print('회원가입 시도');
                          context.go('/sign-in');
                        }
                        : null,
              ),
            ),
            AnnounceLine('Or sign in With'),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(iconPath: 'assets/images/google.png'),
                SizedBox(width: 30),
                SocialIcon(iconPath: 'assets/images/facebook.png'),
              ],
            ),
            GestureDetector(
              onTap: () => context.go('/sign-in'),
              child: Padding(
                padding: EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyles.smallerBold.copyWith(
                        color: ColorStyles.black,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Sign In",
                      style: TextStyles.smallerBold.copyWith(
                        color: ColorStyles.secondary100,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
