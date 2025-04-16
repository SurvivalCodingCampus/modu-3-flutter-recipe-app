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
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              SizedBox(
                width: 84,
                height: 45,
                child: Text(
                  'Hello',
                  style: TextStyles.headerTextBold.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                width: 155,
                height: 30,
                child: Text(
                  'Welcome Back!',
                  style: TextStyles.largeTextRegular.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 57),
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
              // SizedBox(height: 30),
              InputFieldWidget(
                label: 'Enter Password',
                placeHolder: 'Enter Password',
                value: password,
                onValueChange: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              // SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Forget Password?',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.secondary100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              BigButtonsWidget(
                onClick: () {
                  context.go('${Routes.signUp}/${Routes.home}');
                },
                buttons: Buttons(name: 'Sign In'),
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
              SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyles.smallerTextBold,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(Routes.signIn);
                    },
                    child: Text(
                      ' Sign up',
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
    );
  }
}
