import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/buttons/big_button.dart';
import 'package:recipe_app/presentation/component/buttons/rounded_icon_button.dart';
import 'package:recipe_app/presentation/component/form/input_field.dart';
import 'package:recipe_app/presentation/component/styled_checkbox.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 30,
              right: 30,
              bottom: 99,
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
                        style: TextStyles.headerTextBold,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Let's help you set up your account,",
                        style: TextStyles.smallTextRegular,
                      ),
                      Text(
                        "it won't take long",
                        style: TextStyles.smallTextRegular,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  spacing: 20,
                  children: [
                    InputField(
                      label: 'Name',
                      placeholder: 'Enter Name',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Email',
                      placeholder: 'Enter Email',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Password',
                      placeholder: 'Enter Password',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Confirm Password',
                      placeholder: 'Retype Password',
                      onValueChange: (value) {},
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      children: [
                        StyledCheckbox(text: 'Accept terms & Condition'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                BigButton(text: 'Sign In', onPressed: () {}),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Container(
                      width: 50,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: ColorStyles.gray4, width: 1),
                      ),
                    ),
                    Text(
                      'Or Sign in With',
                      style: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.gray4,
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: ColorStyles.gray4, width: 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 25,
                  children: [
                    RoundedIconButton(icon: Icons.facebook, onPressed: () {}),
                    RoundedIconButton(icon: Icons.apple, onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyles.smallTextSemiBold.copyWith(
                        color: ColorStyles.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.login);
                      },
                      child: Text(
                        ' Sign In',
                        style: TextStyles.smallTextBold.copyWith(
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
