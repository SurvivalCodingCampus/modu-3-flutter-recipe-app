import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/divider_with_text.dart';
import 'package:recipe_app/presentation/component/social_login_button.dart';

class SocialSignInSection extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;

  const SocialSignInSection({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DividerWithText(text: 'Or Sign in With'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialLoginButton(
              imagePath: 'assets/images/icons/icon_google.png',
              onTap: onGoogleTap,
            ),
            const SizedBox(width: 24),
            SocialLoginButton(
              imagePath: 'assets/images/icons/icon_facebook.png',
              onTap: onFacebookTap,
            ),
          ],
        ),
      ],
    );
  }
}
