import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/ingredient/auth/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

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
                  Text('Create an account', style: TextStyles.largeBold()),
                  Text('Let\'s help you set up your account', style: TextStyles.smallRegular()),
                  Text('it won\'t take long', style: TextStyles.smallRegular()),
                  SizedBox(height: 50),
                  InputFieldWidget(
                    label: 'Name',
                    placeHolder: 'Enter Name',
                    verticalHeight: 20,
                    onValueChange: (String value) {},
                  ),
                  SizedBox(height: 30),
                  InputFieldWidget(
                    label: 'Email',
                    placeHolder: 'Enter Email',
                    verticalHeight: 20,
                    onValueChange: (String value) {},
                  ),
                  SizedBox(height: 20),
                  InputFieldWidget(
                    label: 'Password',
                    placeHolder: 'Enter Password',
                    verticalHeight: 20,
                    onValueChange: (String value) {},
                  ),
                  SizedBox(height: 30),
                  InputFieldWidget(
                    label: 'Confirm Password',
                    placeHolder: 'Retype Password',
                    verticalHeight: 20,
                    onValueChange: (String value) {},
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isChecked = !_isChecked;
                          });
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorStyles.secondary100,
                              width: 2
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: _isChecked
                                ? ColorStyles.secondary100
                                : ColorStyles.white,
                          ),
                          child: _isChecked
                              ? Icon(Icons.check, size: 18, color: Colors.white)
                              : null,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Accept terms & Condition',
                        style: TextStyles.smallRegular(
                          color: ColorStyles.secondary100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        buttonSize: ButtonSize.big,
                        buttonText: 'Sign Up',
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
                        'Already a member?',
                        style: TextStyles.smallerBold(),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go(Routes.signIn);
                        },
                        child: Text(
                          'Sign in',
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
