// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/label_input_field.dart';
import 'package:recipe_app/ui/ui.dart';

class SignInScreen extends StatelessWidget {
  final VoidCallback onTapSignUp;
  final VoidCallback onTapSignIn;
  const SignInScreen({
    super.key,
    required this.onTapSignIn,
    required this.onTapSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyles.headerTextBold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Welcome Back!",
                      style: TextStyles.largeTextRegular.copyWith(
                        color: ColorStyles.labelColor,
                      ),
                    ),
                    const SizedBox(height: 57),
                    const LabelInputField(
                      label: 'Email',
                      placeholder: 'Enter Email',
                    ),
                    const SizedBox(height: 30),
                    const LabelInputField(
                      label: 'Enter Password',
                      placeholder: 'Enter Password',
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Forgot Password?",
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                    const SizedBox(height: 25),
                    BigButton(text: 'Sign In', onTap: onTapSignIn),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorStyles.gray4),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          "Or Sign In With",
                          style: TextStyles.smallerTextBold.copyWith(
                            color: ColorStyles.gray4,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          height: 1,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorStyles.gray4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google_button.png",
                          width: 60,
                          height: 60,
                        ),
                        const SizedBox(width: 25),
                        Image.asset(
                          "assets/images/facebook_button.png",
                          width: 60,
                          height: 60,
                        ),
                      ],
                    ),
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: onTapSignUp,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyles.smallerTextRegular.copyWith(
                                    color: ColorStyles.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyles.smallerTextBold.copyWith(
                                    color: ColorStyles.secondary100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
