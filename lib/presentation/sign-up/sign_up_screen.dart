import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/label_input_field.dart';

import '../../ui/ui.dart';
import '../component/big_button.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onTapSignIn;
  const SignUpScreen({super.key, required this.onTapSignIn});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create an account,",
                      style: TextStyles.largeTextBold.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Let’s help you set up your account,\nit won’t take long.",
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.labelColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const LabelInputField(
                      label: 'Name',
                      placeholder: 'Enter Name',
                    ),
                    const SizedBox(height: 20),
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
                    const LabelInputField(
                      label: 'Confirm Password',
                      placeholder: 'Retype Password',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: ColorStyles.secondary100,
                          side: const BorderSide(
                            color: ColorStyles.secondary100,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          "Accept terms & Condition",
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.secondary100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    BigButton(text: 'Sign Up', onTap: () {}),
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
                          onTap: widget.onTapSignIn,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already a member? ",
                                  style: TextStyles.smallerTextRegular.copyWith(
                                    color: ColorStyles.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign In",
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
