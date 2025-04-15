import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 94,
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
                      Text('Hello,', style: TextStyles.headerTextBold),
                      Text('Welcome Back!', style: TextStyles.largeTextRegular),
                    ],
                  ),
                ),
                const SizedBox(height: 57),
                Column(
                  spacing: 30,
                  children: [
                    InputField(
                      label: 'Email',
                      placeholder: 'Enter Email',
                      onValueChange: (value) {},
                    ),
                    InputField(
                      label: 'Enter Password',
                      placeholder: 'Enter Password',
                      onValueChange: (value) {},
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.smallTextRegular.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
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
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyles.smallTextSemiBold.copyWith(
                        color: ColorStyles.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.register);
                      },
                      child: Text(
                        ' Sign up',
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
