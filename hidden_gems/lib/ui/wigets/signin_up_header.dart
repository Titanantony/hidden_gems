import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class SignInUpHeader extends StatelessWidget {
  final String text;
  const SignInUpHeader({super.key, this.text = "Login"});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: authTextColor,
      ),
    );
  }
}
