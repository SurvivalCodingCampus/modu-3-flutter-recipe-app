import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create an account,", style: TextStyles.largeTextBold),
                SizedBox(height: 5),
                Text(
                  "Let’s help you set up your account,",
                  style: TextStyles.smallerTextRegular,
                ),
                Text(
                  "it won’t take long.",
                  style: TextStyles.smallerTextRegular,
                ),
                SizedBox(height: 20),
                InputField(
                  label: 'Name',
                  placeHolder: 'Enter Name',
                  isSearch: false,
                  onValueChange: (String value) {},
                  onTap: () {
                  
                },
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                InputField(
                  label: 'Email',
                  placeHolder: 'Enter Email',
                  isSearch: false,
                  onValueChange: (String value) {},
                  onTap: () {
                    
                  },
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                InputField(
                  label: 'Password',
                  placeHolder: 'Enter Password',
                  isSearch: false,
                  onValueChange: (String value) {},
                  onTap: () {
                    
                  },
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                InputField(
                  label: 'Confirm Password',
                  placeHolder: 'Retype Password',
                  isSearch: false,
                  onValueChange: (String value) {},
                  onTap: () {
                    
                  },
                  controller: TextEditingController(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorStyles.secondary100),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Accept terms & Condition',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                BigButton(
                  name: "Sign Up",
                  onClick: () {},
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
                      "Already a member? ",
                      style: TextStyles.smallerTextBold.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(Routes.signIn);
                      },
                      child: Text(
                        "Sign In",
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
      ),
    );
  }
}
