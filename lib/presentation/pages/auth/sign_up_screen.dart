import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/router/routes.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _confirmPassword = TextEditingController();

  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create an account', style: AppTextStyle.largeBold),
              Text(
                'Let’s help you set up your account,\nit won’t take long.',
                style: AppTextStyle.smallerRegular,
              ),
              const SizedBox(height: 20),
              Text('Name', style: AppTextStyle.smallRegular),
              AppTextField(controller: _name, hintText: 'Enter Name'),
              const SizedBox(height: 20),
              Text('Email', style: AppTextStyle.smallRegular),
              AppTextField(controller: _email, hintText: 'Enter email'),
              const SizedBox(height: 20),
              Text('Password', style: AppTextStyle.smallRegular),
              AppTextField(controller: _password, hintText: 'Enter Password'),
              const SizedBox(height: 20),
              Text('Confirm Password', style: AppTextStyle.smallRegular),
              AppTextField(
                controller: _confirmPassword,
                hintText: 'Retype Password',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkbox,
                      fillColor: WidgetStateColor.resolveWith((state) {
                        if (!state.contains(WidgetState.selected)) {
                          return Colors.transparent;
                        }
                        return AppColor.secondary100;
                      }),
                      side: const BorderSide(
                        color: AppColor.secondary100,
                        width: 1,
                      ),
                      onChanged: (val) {
                        setState(() {
                          checkbox = val!;
                        });
                      },
                    ),
                    Text(
                      'Enter Password',
                      style: AppTextStyle.smallRegular.copyWith(
                        color: AppColor.secondary100,
                      ),
                    ),
                  ],
                ),
              ),
              AppButton(
                text: 'Sign Up',
                onClick: () {
                  context.replace(AppRoutes.home);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 1, width: 50, color: AppColor.grey4),
                    Text(
                      ' Or Sign in With ',
                      style: AppTextStyle.smallRegular.copyWith(
                        color: AppColor.grey4,
                      ),
                    ),
                    Container(height: 1, width: 50, color: AppColor.grey4),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.boxShadow.withValues(alpha: 0.15),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.network(
                      width: 24,
                      height: 24,
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/480px-Google_%22G%22_logo.svg.png',
                    ),
                  ),
                  const SizedBox(width: 25),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.boxShadow.withValues(alpha: 0.15),
                          spreadRadius: 3,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.network(
                      width: 24,
                      height: 24,
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Facebook_logo_%28square%29.png/640px-Facebook_logo_%28square%29.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member?', style: AppTextStyle.smallerRegular),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      context.replace(AppRoutes.signIn);
                    },
                    child: Text(
                      'Sign in',
                      style: AppTextStyle.smallerRegular.copyWith(
                        color: AppColor.secondary100,
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
