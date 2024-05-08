import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SignInButton(
            Buttons.facebook,
            text: 'Facebook',
            onPressed: () {
              // Facebook sign-in logic
            },
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SignInButton(
            Buttons.google,
            text: 'Google',
            onPressed: () {
              // Google sign-in logic
            },
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        )
      ],
    );
  }
}
