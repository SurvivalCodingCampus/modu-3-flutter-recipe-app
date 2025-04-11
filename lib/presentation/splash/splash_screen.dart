import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/components.dart';
import '../../ui/ui.dart';

class SplashScreen extends StatelessWidget {
  static const String hatIconImageUrl =
      'https://s3-alpha-sig.figma.com/img/ff39/4279/da6962f85f63700597b722a6b0937b90?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=S1~7rHGgP8H3EZkfOFmZ3pDk14NVvnfogSZmqxjB7J9SjOtqElr4vlaEXH3PlxWLG8KWwbkjRm~czqFCWTnMA~8-WmDIbQvsYUCG7DPECBNJiOK72Y9Fp0ykPDsneBTE-MwkpipPX12XjhX9~NFcqBOTu37UIKjRsOn4p413UMzveShz-lSsEwp5Fp5SZOsBoz7A2QKvospJF9coS75U5Ttx8bgqDgj-FvZ3ndUJbVGKgycIV8HJK2-f3TMdCb9Va9Vx8VQf4Z5ZklzI28rUaJyShHn0H1wGFjWJVR7pystoPSj7eRcX6700bUsT~QBxbiKCPdspLMbb4zqZ~eacmw__';
  static const String backgroundImageUrl =
      'https://s3-alpha-sig.figma.com/img/abb8/bc9a/d3d82b4122f5602afeadd620a4c53d15?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fjLE9WV-6wvM~rNvMZw5QN4JJaCjfeOx1BftSZQwQjEVGgjVL-D48lDmwlzXGybHC7QzAGIN2B0~ymjKx61FVHZbeEC-q4Fsyg4Ttl8g9ksZzdcZTjX-PixP0TqFJ47C~0HzJ6CLyg7aTyVhhzYqRCdcjyu99NqfNyQ02b9gMDk3NVLMpKxWNbwiKjAMqy-eokb0-NHIVhNdrfNGAj6xiNj7LJyoyNdgE~0K87zq4x16f4wwTQXCm5enX8Pf8ouLiWAq0LEL0ZG9~EbR~OXhMoDYaFfCoqj7A-DairRzHc4zbX7qjIy4yYHxrbY0RN544SMBIUv21wXp4lnjqR1W~w__';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(backgroundImageUrl, fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorStyles.black.withAlpha(0),
                    ColorStyles.black.withAlpha(255),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: kToolbarHeight,
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.network(hatIconImageUrl, width: 79),
                  const SizedBox(height: 14),
                  Text(
                    '100K+ Premium Recipe',
                    style: TextStyles.mediumTextBold.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Get Cooking',
                    textAlign: TextAlign.center,
                    style: TextStyles.titleTextBold.copyWith(
                      color: ColorStyles.white,
                      height: 1.2,
                    ),
                  ),
                  Text(
                    'Simple way to find Tasty Recipe',
                    style: TextStyles.normalTextRegular.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                  const SizedBox(height: 60),
                  BigButton(
                    text: 'Start Cooking',
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                  const SizedBox(height: 84),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
