import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/auth_custom_button.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCustomButton(
      text: 'Login',
      color: authButtonColor,
      width: 200,
      height: 50,
      onPressed: () {
        // Implement login logic here
      },
    );
  }
}
