import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello,', style: TextStyles.headerBold()),
                  Text('Welcome Back!', style: TextStyles.largeRegular()),
                  SizedBox(height: 50),
                  InputFieldWidget(
                    label: 'Email',
                    placeHolder: 'Enter Email',
                    verticalHeight: 20,
                    onValueChange: (String value) {},
                  ),
                  SizedBox(height: 30),
                  InputFieldWidget(
                    label: 'Enter Password',
                    placeHolder: 'Enter Password',
                    verticalHeight: 20,
                    onValueChange: (String value) {},
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.smallRegular(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        buttonSize: ButtonSize.big,
                        buttonText: 'Sign In',
                        onClick: () {
                          context.go(Routes.home);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        child: Divider(color: ColorStyles.gray4, thickness: 1),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Or Sign in With',
                        style: TextStyles.smallerRegular(
                          color: ColorStyles.gray4,
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 50,
                        child: Divider(color: ColorStyles.gray4, thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        imagePath: 'assets/images/icons/google.png',
                        onClick: () {},
                      ),
                      SizedBox(width: 20),
                      SocialLoginButton(
                        imagePath: 'assets/images/icons/facebook.png',
                        onClick: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyles.smallerBold(),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(Routes.signUp);
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyles.smallerBold(
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
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final void Function() onClick;
  final String imagePath;

  const SocialLoginButton({
    super.key,
    required this.imagePath,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: ColorStyles.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Center(child: Image.asset(imagePath, width: 24, height: 24)),
      ),
    );
  }
}
