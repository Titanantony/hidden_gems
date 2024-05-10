import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/auth_custom_text_field.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const PasswordTextField(this.controller,
      {super.key, this.labelText = 'Password'});

  @override
  Widget build(BuildContext context) {
    return AuthCustomTextField(
      controller: controller,
      hintText: labelText,
      obscureText: true,
      prefixIcon: const Icon(Icons.lock, color: authTextColor),
      isPassword: true,
    );
  }
}
