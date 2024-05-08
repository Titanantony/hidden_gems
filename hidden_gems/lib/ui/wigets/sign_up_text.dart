import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
              color: authTextlinkColor,
            ),
          ),
          TextSpan(
            text: "Sign up",
            style: TextStyle(
              color: linkColor,
            ),
          ),
        ],
      ),
    );
  }
}
