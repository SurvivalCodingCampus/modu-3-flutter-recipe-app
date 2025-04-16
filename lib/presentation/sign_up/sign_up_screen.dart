import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/routes.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameFocus = FocusNode();
    final emailFocus = FocusNode();
    final passwordFocus = FocusNode();
    final confirmFocus = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text('Create an account', style: AppTextStyles.largeBold),
                const SizedBox(height: 8),
                Text(
                  "Let's help you set up your account,\nit won't take long.",
                  style: AppTextStyles.smallRegular,
                ),
                const SizedBox(height: 40),

                // 이름
                InputField(
                  titleLabel: 'Name',
                  inputValue: '',
                  focusNode: nameFocus,
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 20),

                // 이메일
                InputField(
                  titleLabel: 'Email',
                  inputValue: '',
                  focusNode: emailFocus,
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 20),

                // 비밀번호
                InputField(
                  titleLabel: 'Password',
                  inputValue: '',
                  focusNode: passwordFocus,
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 20),

                // 비밀번호 확인
                InputField(
                  titleLabel: 'Confirm Password',
                  inputValue: '',
                  focusNode: confirmFocus,
                  onValueChange: (value) {},
                ),
                const SizedBox(height: 16),

                // 약관 동의 체크 (기능 사용 안함)
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      side: const BorderSide(
                        color: ColorStyle.secondary100,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Accept terms & Condition',
                      style: AppTextStyles.smallRegular.copyWith(
                        color: ColorStyle.secondary100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 회원가입 버튼
                BigButton(
                  lable: 'Sign Up',
                  onClick: () {
                    context.push(Routes.signIn);
                  },
                ),
                const SizedBox(height: 18),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Expanded(
                        child: Divider(thickness: 1, color: ColorStyle.gray4),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Or Sign in With',
                        style: AppTextStyles.smallRegular.copyWith(
                          color: ColorStyle.gray4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Expanded(
                        child: Divider(thickness: 1, color: ColorStyle.gray4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // SNS 로그인 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyle.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.zero,
                        minimumSize: Size(44, 44),
                      ),
                      child: Image.asset(
                        'assets/icons/google.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyle.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.zero,
                        minimumSize: Size(44, 44),
                      ),
                      child: Image.asset(
                        'assets/icons/facebook.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 이미 회원이신가?
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a member? ",
                        style: AppTextStyles.smallRegular,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(Routes.signIn);
                        },
                        child: Text(
                          'Sign In',
                          style: AppTextStyles.smallRegular.copyWith(
                            color: ColorStyle.secondary100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
