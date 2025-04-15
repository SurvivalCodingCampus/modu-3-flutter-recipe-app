import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/main/sign_up/sign_up_view_model.dart';

import '../../../ui/text_styles.dart';
import '../../component/accept_button.dart';
import '../../component/big_button.dart';
import '../../component/input_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, required this.viewModel});

  final SignUpViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Create an account',
            style: TextStyles.largeBold.copyWith(fontSize: 20),
          ),
          Text(
            "Let's help you set up your account, \n it won't take long.",
            style: TextStyles.smallerRegular.copyWith(fontSize: 11),
          ),
          InputField(
            label: 'Name',
            holder: 'Enter Name',
            onChanged: (value) {
              viewModel.updateName(value);
            },
          ),
          InputField(
            label: 'Email',
            holder: 'Enter Email',
            onChanged: (value) {
              viewModel.updateEmail(value);
            },
          ),
          InputField(
            label: 'Password',
            holder: 'Enter Password',
            onChanged: (value) {
              viewModel.updatePassword(value);
            },
          ),
          InputField(
            label: 'Confirm Password',
            holder: 'Confirm Password',
            onChanged: (value) {
              viewModel.confirmPassword(value);
            },
          ),
          AcceptButton(text: 'Accept terms & Condition'),
          BigButton(
            text: 'Sign Up',
            onClick:
                viewModel.state.isValid
                    ? () {
                      print('회원가입 시도');
                      context.go('/sign-in');
                    }
                    : null,
          ),
        ],
      ),
    );
  }
}
