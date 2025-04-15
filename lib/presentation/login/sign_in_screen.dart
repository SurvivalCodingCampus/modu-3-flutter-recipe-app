

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/buttons.dart';
import 'package:recipe_app/presentation/component/head_text_filed.dart';

import '../../router/routes.dart';
import '../../ui/text.dart';

void main() {

  runApp(
      MaterialApp(
        home: Scaffold(
          body: SignInScreen(),
        ),
      )
  );
}


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: ValueNotifier(false),
        builder: (context, index) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Hello,',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Welcome Back!',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  HeadTextFiled(
                      textFiledName: 'Email',
                      hintTextFiledName: 'Enter Email'
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  HeadTextFiled(
                      textFiledName: 'Enter Password',
                      hintTextFiledName: 'Enter Password'
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Text('Forgot Password?',
                            style: TextStyles.smallerTextRegular.copyWith(
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Buttons(onClick: () {
                    context.go(Routes.home);
                  },
                    buttonName: 'Sign In'
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            endIndent: 10,
                          ),
                        ),
                        Text('Or Sign in with',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8,
                                  spreadRadius: 3,
                                  offset: Offset(0, 4)
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset('assets/images/google.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8,
                                    spreadRadius: 3,
                                    offset: Offset(0, 4)
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset('assets/images/facebook.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                        style: TextStyles.smallerTextRegular,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go(Routes.signUp);
                        },
                        child: Text('Sing up',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: Colors.amber
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
