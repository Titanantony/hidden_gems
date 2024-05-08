import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: authTextColor,
      ),
    );
  }
}
