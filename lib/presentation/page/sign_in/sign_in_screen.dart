import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/common/component/color_text_button.dart';
import 'package:recipe_app/presentation/common/component/custom_input_field.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Text('Hello,', style: AppTextStyles.headerBold()),
              Text('Welcome Back!', style: AppTextStyles.largeRegular()),
              SizedBox(height: 57),
              CustomInputField(labelString: 'Email', hintString: 'Enter Email'),
              SizedBox(height: 30),
              CustomInputField(
                labelString: 'Enter Password',
                hintString: 'Enter Password',
              ),
              SizedBox(height: 20),
              Text(
                'Forgot Password?',
                style: AppTextStyles.smallRegular(
                  color: ColorStyle.secondary100,
                ),
              ),
              SizedBox(height: 20),
              ColorTextButton(
                buttonWidth: double.infinity,
                buttonHeight: 60,
                buttonText: 'Sign In',
                buttonColor: ColorStyle.primary100,
                textColor: ColorStyle.white,
                buttonRadius: 10,
                onPressed: () {
                  context.go("/home");
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 50, height: 1, color: ColorStyle.gray4),
                  Text(
                    'Or Sign in With',
                    style: AppTextStyles.smallBold().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: ColorStyle.gray4,
                    ),
                  ),
                  Container(width: 50, height: 1, color: ColorStyle.gray4),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25,
                children: [
                  Material(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset('assets/icons/google_icon.png'),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(10),
                    elevation: 2,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset('assets/icons/facebook.png'),
                        ),
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
                    "Don't have an account?",
                    style: AppTextStyles.smallBold().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: ColorStyle.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.go("/sign-up");
                    },
                    child: Text(
                      "Sign up",
                      style: AppTextStyles.smallBold().copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        color: ColorStyle.secondary100,
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
