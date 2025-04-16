import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/common/component/color_text_button.dart';
import 'package:recipe_app/presentation/common/component/custom_input_field.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool acceptCheckbox = false;

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
              SizedBox(height: 10),
              Text('Create an account,', style: AppTextStyles.headerBold()),
              Text(
                'Let’s help you set up your account,\nit won’t take long.',
                style: AppTextStyles.smallRegular(),
              ),
              SizedBox(height: 20),
              CustomInputField(labelString: 'name', hintString: 'Enter name'),
              SizedBox(height: 20),
              CustomInputField(labelString: 'Email', hintString: 'Enter email'),
              SizedBox(height: 20),
              CustomInputField(
                labelString: 'Password',
                hintString: 'Enter Password',
              ),
              SizedBox(height: 20),
              CustomInputField(
                labelString: 'Confirm Password',
                hintString: 'Retype Password',
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    activeColor: ColorStyle.secondary100,
                    side: BorderSide(
                      color: ColorStyle.secondary100,
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter
                    ),
                    value: acceptCheckbox,
                    onChanged: (value) {
                      setState(() {
                        value != null
                            ? acceptCheckbox = value
                            : acceptCheckbox = !acceptCheckbox;
                      });
                    },
                  ),
                  Text(
                    'Accept terms & Condition',
                    style: AppTextStyles.smallRegular(
                      color: ColorStyle.secondary100,
                    ),
                  ),
                ],
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
                    "Already a member?",
                    style: AppTextStyles.smallBold().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: ColorStyle.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.go('/sign-in');
                    },
                    child: Text(
                      "Sign In",
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
