import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import '../../../ui/text_styles.dart';
import '../../component/big_button.dart';

class SignIn extends StatelessWidget {
  final SignInViewModel viewModel;
  const SignIn({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (BuildContext context, Widget? child) {
          final state = viewModel.state;
          return Column(
            children: [
              Text(
                'Hello,',
                style: TextStyles.headerBold.copyWith(fontSize: 30),
              ),
              Text(
                'Welcome Back!',
                style: TextStyles.largeRegular.copyWith(fontSize: 20),
              ),

              InputField(
                label: 'Email',
                holder: 'Enter Email',
                onChanged: (value) {
                  viewModel.updateEmail(value);
                },
              ),
              InputField(
                label: 'Enter Password',
                holder: 'Enter Password',
                onChanged: (value) {
                  viewModel.updatePassword(value);
                },
              ),

              Text(
                'Forgot Password?',
                style: TextStyles.normalRegular.copyWith(
                  color: ColorStyles.secondary100,
                  fontSize: 11,
                ),
              ),

              BigButton(
                text: 'Sign In',
                onClick:
                    viewModel.state.isValid
                        ? () {
                          print('로그인 시도');
                          context.go('/search-recipes');
                        }
                        : null,
                isEnabled: viewModel.state.isValid,
              ),

              Text(
                '--------- Or Sign in With ---------',
                style: TextStyles.smallerBold.copyWith(
                  color: ColorStyles.gray4,
                  fontSize: 11,
                ),
              ),
              Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/images/google.png'),
                    color: ColorStyles.white,
                    size: 44,
                  ),
                  SizedBox(width: 10),
                  ImageIcon(
                    AssetImage('assets/images/facebook.png'),
                    color: ColorStyles.white,
                    size: 44,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => context.go('/sign-up'),
                child: Row(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyles.smallerBold.copyWith(
                        color: ColorStyles.black,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyles.smallerBold.copyWith(
                        color: ColorStyles.secondary100,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
