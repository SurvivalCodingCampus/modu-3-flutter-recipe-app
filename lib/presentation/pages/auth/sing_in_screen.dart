import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/router/routes.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello', style: AppTextStyle.headerBold),
            Text('Welcome Back!', style: AppTextStyle.largeRegular),
            const SizedBox(height: 50),
            Text('Email', style: AppTextStyle.smallRegular),
            AppTextField(controller: _email, hintText: 'Enter email'),
            const SizedBox(height: 30),
            Text('Enter Password', style: AppTextStyle.smallRegular),
            AppTextField(controller: _email, hintText: 'Enter Password'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                'Enter Password',
                style: AppTextStyle.smallRegular.copyWith(
                  color: AppColor.secondary100,
                ),
              ),
            ),
            AppButton(
              text: 'Sign In',
              onClick: () {
                context.replace(AppRoutes.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
