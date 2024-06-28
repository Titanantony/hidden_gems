import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/auth_custom_button.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class LoginButton extends StatelessWidget {
  final String buttonText; // Add a text parameter for customization
  final VoidCallback onPressed;

  const LoginButton(
      {super.key, this.buttonText = 'Login', required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AuthCustomButton(
      text: buttonText,
      color: authButtonColor,
      width: 200,
      height: 50,
      onPressed: onPressed,
    );
  }
}
