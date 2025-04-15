import 'package:flutter/material.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailFocus = FocusNode();
    final passwordFocus = FocusNode();

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Hello,',
                style: AppTextStyles.headerBold,
              ),
              const SizedBox(height: 4),
              Text(
                'Welcome Back!',
                style: AppTextStyles.largeRegular,
              ),
              const SizedBox(height: 40),

              // 이메일
              InputField(
                titleLabel: 'Email',
                inputValue: '',
                focusNode: emailFocus,
                onValueChange: (value) {},
              ),
              const SizedBox(height: 20),

              // 패스워드
              InputField(
                titleLabel: 'Enter Password',
                inputValue: '',
                focusNode: passwordFocus,
                onValueChange: (value) {},
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyles.smallRegular.copyWith(color: ColorStyle.secondary100),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              /// Sign In Button
              BigButton(lable: 'Sign In',
                  onClick: () {},
                ),

              const SizedBox(height: 24),

              /// Divider with text
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Or Sign in With'),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 16),

              /// Social login buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      // 버튼 클릭
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero, // 여백 제거 (선택)
                      minimumSize: Size(44, 44), // 버튼 크기 (선택)
                    ),
                    child: Image.asset(
                      'assets/icons/google.png', // 이미지 경로
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),


                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // 버튼 클릭
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyle.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.zero, // 여백 제거 (선택)
                      minimumSize: Size(44, 44), // 버튼 크기 (선택)
                    ),
                    child: Image.asset(
                      'assets/icons/facebook.png', // 이미지 경로
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const Spacer(),

              /// Sign up link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: AppTextStyles.smallRegular),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign up',
                        style: AppTextStyles.smallRegular.copyWith(color: ColorStyle.secondary100),
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
    );
  }
}