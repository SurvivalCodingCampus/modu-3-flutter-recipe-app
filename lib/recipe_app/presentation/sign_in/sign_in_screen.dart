import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello,', style: TextStyles2.headerTextBold),
                Text('Welcome Back!', style: TextStyles2.largeTextRegular),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email', style: TextStyles2.smallTextRegular),
                    TextField(
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorStyles2.gray4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorStyles2.gray4),
                        ),
                        hintText: 'Enter Email',
                        hintStyle: TextStyles2.smallerTextRegular,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text('Enter Password', style: TextStyles2.smallTextRegular),
                    TextField(
                      controller: _passwordTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorStyles2.gray4),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorStyles2.gray4),
                        ),
                        hintText: 'Enter Password',
                        hintStyle: TextStyles2.smallerTextRegular,
                      ),
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles2.smallerTextRegular.copyWith(
                          color: ColorStyles2.secondary100,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        context.go(Routes.homeScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyles2.primary100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Sign In', style: TextStyles2.normalTextBold),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: ColorStyles2.gray4,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or Sign in With',
                            style: TextStyles2.smallerTextSemiBold.copyWith(
                              color: ColorStyles2.gray4,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: Divider(
                            color: ColorStyles2.gray4,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: ColorStyles2.shadowColor.withValues(
                                  alpha: 0.1,
                                ),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/google_icon.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: ColorStyles2.shadowColor.withValues(
                                  alpha: 0.1,
                                ),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/facebook_icon.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.contain,
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
                          'Don\'t have an account?',
                          style: TextStyles2.smallerTextSemiBold.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(Routes.signUp);
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyles2.smallerTextSemiBold.copyWith(
                              color: ColorStyles2.secondary100,
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
