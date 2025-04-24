import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/components/medium_button.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class SplashScreen extends StatefulWidget {
  final SplashViewModel viewModel;
  const SplashScreen({super.key, required this.viewModel});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.stream.listen(
      (event) {
        print("정상");
      },
      onError: (error) {
        final snackBar = SnackBar(
          showCloseIcon: true,
          duration: Duration(seconds: 3),
          content: Text(error.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );

    widget.viewModel.networkError();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // Android
        statusBarBrightness: Brightness.dark, // iOS
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_screen.png'),
                  // NetworkImage(
                  //   'https://s3-alpha-sig.figma.com/img/abb8/bc9a/d3d82b4122f5602afeadd620a4c53d15?Expires=1746403200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=othyBsis8k-HqoNlINYZ6q0TGjAl1w~8iveAM4B6zRDUG3305bDKsS-w1Sfo5wXP7qDs45G7u8YgbReOtazkDWAO-bqu1Rp2wAFI~cSMyIJDmLjhyCKIM9TCBr~achW3O0cA9BKnCIrBmLJH~r3-de9HQkuwPjNL6GQZCQJlaOHRWlKAAxQwWKdz~W~0tLnZFQ9h93fZiV6nWsVS1fzFvwmIXcs6RAIDsEX8PVVEIKFTFW-6V30Q647cN42Tb43yUi~si3F2Kco~ietzUmQvPbzdFQp7UiD67Ucw8d75AHzDt9Os8zmE9YESJzCgE9t1~UKUx4g5muml6RGVcBy0tw__',
                  // ),
                  onError: (exception, stackTrace) {
                    final snackBar = SnackBar(
                      showCloseIcon: true,
                      duration: Duration(seconds: 3),
                      content: Text(exception.toString() ?? ''),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 104),
                  Image.asset(
                    'assets/images/splash_icon.png',
                    width: 79,
                    height: 79,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "100K+ Premium Recipe ",
                    style: TextStyles.mediumTextBold.copyWith(
                      color: ColorStyles.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 222),
                  SizedBox(
                    width: 275,
                    // height: 164,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Get Cooking',
                          style: TextStyles.titleTextBold.copyWith(
                            color: ColorStyles.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Simple way to find Tasty Recipe',
                          style: TextStyles.normalTextRegular.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                        SizedBox(height: 64),
                        MediumButton(
                          name: 'Start Cooking',
                          onClick: () {
                            context.go(Routes.signIn);
                          },
                          icon: Icons.arrow_forward,
                          color: ColorStyles.primary100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
