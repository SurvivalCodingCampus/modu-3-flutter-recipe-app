import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/components/big_button.dart';
import 'package:recipe_app/presentation/components/input_field.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello,", style: TextStyles.headerTextBold),
              Text("Welcome Back!", style: TextStyles.largeTextRegular),
              SizedBox(height: 57),
              InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
                isSearch: false,
                onValueChange: (String value) {},
                controller: TextEditingController(),
                onTap: () {},
              ),
              SizedBox(height: 30),
              InputField(
                label: 'Enter Password',
                placeHolder: 'Enter Password',
                isSearch: false,
                onValueChange: (String value) {},
                onTap: () {},
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              Text(
                'Forgot Password?',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.secondary100,
                ),
              ),
              SizedBox(height: 25),
              BigButton(
                name: "Sign In",
                onClick: () {
                  context.go(Routes.home);
                },
                icon: Icons.arrow_forward,
                color: ColorStyles.primary100,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 1.5,
                    decoration: BoxDecoration(color: ColorStyles.gray4),
                  ),
                  SizedBox(width: 7),
                  Text(
                    "Or Sign in With",
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.gray4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 7),
                  Container(
                    width: 50,
                    height: 1.5,
                    decoration: BoxDecoration(color: ColorStyles.gray4),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Colors.black12),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/google_icon.png",
                        width: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: ColorStyles.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(blurRadius: 4, color: Colors.black12),
                      ],
                    ),

                    child: Center(
                      child: Image.asset(
                        "assets/images/facebook_icon.png",
                        width: 24,
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
                    "Don’t have an account? ",
                    style: TextStyles.smallerTextBold.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(Routes.signUp);
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyles.smallerTextBold.copyWith(
                        color: ColorStyles.secondary100,
                        fontWeight: FontWeight.w500,
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
