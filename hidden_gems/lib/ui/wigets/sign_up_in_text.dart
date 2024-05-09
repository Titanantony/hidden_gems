import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

typedef OnTapCallback = void Function();

class SignUpInText extends StatelessWidget {
  final String preText; // Add a preText parameter for customization
  final String linkText; // Add a signUpInText parameter for customization
  final OnTapCallback onTap; // Add an onTap parameter for customization

  const SignUpInText({
    super.key,
    this.preText = "Don't have an account? ",
    this.linkText = "Sign up",
    required this.onTap, // Make onTap a required parameter
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: preText,
            style: const TextStyle(
              color: authTextlinkColor,
            ),
          ),
          TextSpan(
            text: linkText,
            recognizer: TapGestureRecognizer()
              ..onTap = onTap, // Call the provided onTap function
            style: const TextStyle(
              color: linkColor,
            ),
          ),
        ],
      ),
    );
  }
}
