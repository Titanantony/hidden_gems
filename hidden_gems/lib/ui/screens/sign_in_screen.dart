import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/wigets/email_text_field.dart';
import 'package:hidden_gems/ui/wigets/forgot_password_text.dart';
import 'package:hidden_gems/ui/wigets/login_button.dart';
import 'package:hidden_gems/ui/wigets/login_header.dart';
import 'package:hidden_gems/ui/wigets/logo_widget.dart';
import 'package:hidden_gems/ui/wigets/password_text_field.dart';
import 'package:hidden_gems/ui/wigets/sign_in_divider.dart';
import 'package:hidden_gems/ui/wigets/sign_up_text.dart';
import 'package:hidden_gems/ui/wigets/social_login_buttons.dart';
import 'package:hidden_gems/ui/constants/colors.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        backgroundColor: authBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 32),
                const LoginHeader(),
                const SizedBox(height: 32),
                EmailTextField(_usernameController),
                const SizedBox(height: 16),
                PasswordTextField(_passwordController),
                const SizedBox(height: 24),
                const LoginButton(),
                const SizedBox(height: 16),
                const ForgotPasswordText(),
                const SizedBox(height: 32),
                const SignInDivider(),
                const SizedBox(height: 16),
                const SocialLoginButtons(),
                const SizedBox(height: 16),
                const SignUpText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
