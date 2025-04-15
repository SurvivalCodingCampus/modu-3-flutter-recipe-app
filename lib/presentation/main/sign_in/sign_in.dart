import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/announce_line.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/social_icon.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../../ui/text_styles.dart';
import '../../component/big_button.dart';

class SignIn extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SignInViewModel viewModel;

  SignIn({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 130, left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyles.headerBold.copyWith(fontSize: 30),
                      ),
                      Text(
                        'Welcome Back!',
                        style: TextStyles.largeRegular.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 57),
                  child: InputField(
                    label: 'Email',
                    holder: 'Enter Email',
                    controller: emailController,
                    onChanged: (value) {
                      viewModel.updateEmail(value);
                    },
                  ),
                ),
                InputField(
                  label: 'Enter Password',
                  holder: 'Enter Password',
                  controller: passwordController,
                  onChanged: (value) {
                    viewModel.updatePassword(value);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 25),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.normalRegular.copyWith(
                      color: ColorStyles.secondary100,
                      fontSize: 11,
                    ),
                  ),
                ),

                BigButton(
                  text: 'Sign In',
                  onClick:
                      viewModel.state.isValid
                          ? () {
                            context.go('/home');
                          }
                          : null,
                  isEnabled: viewModel.state.isValid,
                ),
                AnnounceLine('Or Sign in With'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(iconPath: 'assets/images/google.png'),
                    SizedBox(width: 30),
                    SocialIcon(iconPath: 'assets/images/facebook.png'),
                  ],
                ),
                GestureDetector(
                  onTap: () => context.go('/sign-up'),
                  child: Padding(
                    padding: EdgeInsets.only(top: 65),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyles.smallerBold.copyWith(
                            color: ColorStyles.black,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Sign Up",
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
            );
          },
        ),
      ),
    );
  }
}
