import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/routing/routes.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create an account', style: TextStyles.largeTextBold),
              SizedBox(height: 5),
              Text(
                'Let\'s help you set up your account,',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.titleBlackColor,
                ),
              ),
              Text(
                'it won\'t take long.',
                style: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.titleBlackColor,
                ),
              ),
              SizedBox(height: 20),
              Text('Name', style: TextStyles.smallTextRegular),
              TextField(
                controller: _nameTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  hintText: 'Enter Name',
                  hintStyle: TextStyles.smallerTextRegular,
                ),
              ),
              SizedBox(height: 20),
              Text('Email', style: TextStyles.smallTextRegular),
              TextField(
                controller: _emailTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: TextStyles.smallerTextRegular,
                ),
              ),
              SizedBox(height: 20),
              Text('Password', style: TextStyles.smallTextRegular),
              TextField(
                obscureText: true,
                controller: _passwordTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  hintText: 'Enter Password',
                  hintStyle: TextStyles.smallerTextRegular,
                ),
              ),
              SizedBox(height: 20),
              Text('Confirm Password', style: TextStyles.smallTextRegular),
              TextField(
                obscureText: true,
                controller: _confirmPasswordTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: ColorStyles.gray4),
                  ),
                  hintText: 'Retype Password',
                  hintStyle: TextStyles.smallerTextRegular,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: BorderSide(color: ColorStyles.secondary100),
                  ),
                  Text(
                    'Accept terms & Condition',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.secondary100,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyles.primary100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Sign Up', style: TextStyles.normalTextBold),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 16),
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
                    child: Divider(color: ColorStyles.gray4, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or Sign in With',
                      style: TextStyles.smallerTextSemiBold.copyWith(
                        color: ColorStyles.gray4,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Divider(color: ColorStyles.gray4, thickness: 1),
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
                          color: ColorStyles.shadowColor.withValues(alpha: 0.1),
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
                          color: ColorStyles.shadowColor.withValues(alpha: 0.1),
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
                    'Already a member?',
                    style: TextStyles.smallerTextSemiBold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(Routes.signIn);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyles.smallerTextSemiBold.copyWith(
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
