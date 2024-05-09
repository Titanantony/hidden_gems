import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class SignUpInText extends StatelessWidget {
  final String preText; // Add a preText parameter for customization
  final String linkText; // Add a signUpInText parameter for customization

  const SignUpInText(
      {super.key,
      this.preText = "Don't have an account? ",
      this.linkText = "Sign up"});

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
            style: const TextStyle(
              color: linkColor,
            ),
          ),
        ],
      ),
    );
  }
}
