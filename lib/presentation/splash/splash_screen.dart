import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                  image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/abb8/bc9a/d3d82b4122f5602afeadd620a4c53d15?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fjLE9WV-6wvM~rNvMZw5QN4JJaCjfeOx1BftSZQwQjEVGgjVL-D48lDmwlzXGybHC7QzAGIN2B0~ymjKx61FVHZbeEC-q4Fsyg4Ttl8g9ksZzdcZTjX-PixP0TqFJ47C~0HzJ6CLyg7aTyVhhzYqRCdcjyu99NqfNyQ02b9gMDk3NVLMpKxWNbwiKjAMqy-eokb0-NHIVhNdrfNGAj6xiNj7LJyoyNdgE~0K87zq4x16f4wwTQXCm5enX8Pf8ouLiWAq0LEL0ZG9~EbR~OXhMoDYaFfCoqj7A-DairRzHc4zbX7qjIy4yYHxrbY0RN544SMBIUv21wXp4lnjqR1W~w__',
                  ),
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
                  Image.network(
                    'https://s3-alpha-sig.figma.com/img/ff39/4279/da6962f85f63700597b722a6b0937b90?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=S1~7rHGgP8H3EZkfOFmZ3pDk14NVvnfogSZmqxjB7J9SjOtqElr4vlaEXH3PlxWLG8KWwbkjRm~czqFCWTnMA~8-WmDIbQvsYUCG7DPECBNJiOK72Y9Fp0ykPDsneBTE-MwkpipPX12XjhX9~NFcqBOTu37UIKjRsOn4p413UMzveShz-lSsEwp5Fp5SZOsBoz7A2QKvospJF9coS75U5Ttx8bgqDgj-FvZ3ndUJbVGKgycIV8HJK2-f3TMdCb9Va9Vx8VQf4Z5ZklzI28rUaJyShHn0H1wGFjWJVR7pystoPSj7eRcX6700bUsT~QBxbiKCPdspLMbb4zqZ~eacmw__',
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
