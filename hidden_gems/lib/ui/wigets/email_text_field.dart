import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/auth_custom_text_field.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCustomTextField(
      controller: controller,
      hintText: 'Email or phone number',
      prefixIcon: const Icon(Icons.email, color: authTextColor),
    );
  }
}
