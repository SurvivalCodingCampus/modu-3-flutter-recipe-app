import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/social_login_section.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

void main() {
  runApp(const LoginPreviewTestApp());
}

class LoginPreviewTestApp extends StatelessWidget {
  const LoginPreviewTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Preview Test',
      home: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: const LoginPreviewPage(),
      ),
    );
  }
}

class LoginPreviewPage extends StatefulWidget {
  const LoginPreviewPage({super.key});

  @override
  State<LoginPreviewPage> createState() => _LoginPreviewPageState();
}

class _LoginPreviewPageState extends State<LoginPreviewPage>
    with TickerProviderStateMixin {
  String email = '';
  String password = '';

  bool _showSignUp = false;

  late final AnimationController _controller;

  late final Animation<Offset> _upperOffsetAnim;
  late final Animation<Offset> _lowerOffsetAnim;
  late final Animation<double> _fadeAnim;

  late final AnimationController _signUpController;

  late final Animation<double> _scaleAnim;
  late final Animation<double> _signUpFadeAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    /*
    Tween<타입>(begin: 시작값, end: 끝값)
    .animate(CurvedAnimation(...));
     */
    _upperOffsetAnim = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.3),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _lowerOffsetAnim = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.3),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnim = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // 두번째 화면
    _signUpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _signUpController, curve: Curves.easeOutBack),
    );

    _signUpFadeAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _signUpController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startExitAnimation() {
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() => _showSignUp = true);
      _signUpController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Visibility(
              visible: _showSignUp,
              maintainState: true,
              child: SlideTransition(
                position: _upperOffsetAnim,
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: _buildUpperSection(),
                ),
              ),
            ),
            if (!_showSignUp)
              FadeTransition(
                opacity: _signUpFadeAnim,
                child: ScaleTransition(
                  scale: _scaleAnim,
                  child: _buildSignUpScreen(),
                ),
              ),
            Visibility(
              visible: _showSignUp,
              maintainState: true,
              child: SlideTransition(
                position: _lowerOffsetAnim,
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: _buildLowerSection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpperSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello,', style: AppTextStyles.headerBold()),
        Text(
          'Welcome Back!',
          style: AppTextStyles.largeRegular(color: ColorStyle.labelColour),
        ),
        const SizedBox(height: 57),
        InputField(
          labelTitle: 'Email',
          placeholderText: 'Enter your email',
          value: email,
          onValueChange: (val) => setState(() => email = val),
        ),
        const SizedBox(height: 20),
        InputField(
          labelTitle: 'Password',
          placeholderText: 'Enter your password',
          value: password,
          onValueChange: (val) => setState(() => password = val),
        ),
      ],
    );
  }

  Widget _buildLowerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            debugPrint('Forgot password tapped');
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Forgot Password?',
              style: AppTextStyles.smallRegular(color: ColorStyle.secondary100),
            ),
          ),
        ),
        const SizedBox(height: 25),
        BigButton(title: 'Sign In', onTap: () {}),
        const SizedBox(height: 20),
        SocialSignInSection(
          onGoogleTap: () {
            debugPrint("Google login tapped");
          },
          onFacebookTap: () {
            debugPrint("Facebook login tapped");
          },
        ),
        const SizedBox(height: 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account? ',
              style: AppTextStyles.smallRegular(color: ColorStyle.black),
            ),
            GestureDetector(
              onTap: () {
                _startExitAnimation();
              },
              child: Text(
                'Sign up',
                style: AppTextStyles.smallBold(color: ColorStyle.secondary100),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text('Create Account', style: AppTextStyles.largeBold()),
        const SizedBox(height: 5),
        Text(
          'Let’s help you set up your account,\nit won’t take long.',
          style: AppTextStyles.smallRegular(color: ColorStyle.labelColour),
          maxLines: 2,
        ),
        const SizedBox(height: 20),
        InputField(
          labelTitle: 'Name',
          placeholderText: 'Enter Name',
          value: '',
        ),
        const SizedBox(height: 20),
        InputField(
          labelTitle: 'Email',
          placeholderText: 'Enter Email',
          value: '',
        ),
        const SizedBox(height: 20),
        InputField(
          labelTitle: 'Password',
          placeholderText: 'Enter Password',
          value: '',
        ),
        InputField(
          labelTitle: 'Confirm Password',
          placeholderText: 'Retype Password',
          value: '',
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {
                  debugPrint('Checkbox tapped');
                },
                activeColor: ColorStyle.secondary100,
              ),
              Text(
                'Accept terms & Condition',
                style: AppTextStyles.smallRegular(
                  color: ColorStyle.secondary100,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        BigButton(title: 'Sign Up', onTap: () {}),
        const SizedBox(height: 20),
        SocialSignInSection(
          onGoogleTap: () {
            debugPrint("Google login tapped");
          },
          onFacebookTap: () {
            debugPrint("Facebook login tapped");
          },
        ),
        const SizedBox(height: 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already a member? ',
              style: AppTextStyles.smallRegular(color: ColorStyle.black),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showSignUp = true;
                });
              },
              child: Text(
                'Sign In',
                style: AppTextStyles.smallBold(color: ColorStyle.secondary100),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
