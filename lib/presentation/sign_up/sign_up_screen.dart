import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/buttons.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

import '../../core/routing/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String email = '';
  String password = '';
  String confirm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                SizedBox(
                  width: 191,
                  height: 30,
                  child: Text(
                    'Create an account',
                    style: TextStyles.largeTextBold.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 195,
                  height: 34,
                  child: Text(
                    'Let’s help you set up your account, it won’t take long.!',
                    style: TextStyles.smallerTextRegular.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                InputFieldWidget(
                  label: 'Name',
                  placeHolder: 'Enter Name',
                  value: name,
                  onValueChange: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                InputFieldWidget(
                  label: 'Email',
                  placeHolder: 'Enter Email',
                  value: email,
                  onValueChange: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                InputFieldWidget(
                  label: 'Password',
                  placeHolder: 'Enter Password',
                  value: password,
                  onValueChange: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                InputFieldWidget(
                  label: 'Confirm Password',
                  placeHolder: 'Retype Password',
                  value: confirm,
                  onValueChange: (value) {
                    setState(() {
                      confirm = value;
                    });
                  },
                ),
                // SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorStyles.secondary100,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Text(
                          ' Accept terms & Condition',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.secondary100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                BigButtonsWidget(
                  onClick: () {
                    context.go(Routes.home);
                  },
                  buttons: Buttons(name: 'Sign Up'),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 17,
                  child: SizedBox(
                    width: 195,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 50,
                          height: 1,
                          color: ColorStyles.gray4,
                        ),
                        Text(
                          'Or Sign in With',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: ColorStyles.gray4,
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 1,
                          color: ColorStyles.gray4,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/google.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/facebook.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyles.smallerTextBold,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.signIn);
                      },
                      child: Text(
                        ' Sign In',
                        style: TextStyles.smallerTextBold.copyWith(
                          color: ColorStyles.secondary100,
                        ),
                      ),
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
