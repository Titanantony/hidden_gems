import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Forgot your password?',
      style: TextStyle(
        color: linkColor,
      ),
    );
  }
}
