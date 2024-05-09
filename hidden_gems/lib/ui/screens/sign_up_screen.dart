import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/wigets/email_text_field.dart';
import 'package:hidden_gems/ui/wigets/login_button.dart';
import 'package:hidden_gems/ui/wigets/sign_in_up_divider.dart';
import 'package:hidden_gems/ui/wigets/sign_up_in_text.dart';
import 'package:hidden_gems/ui/wigets/signin_up_header.dart';
import 'package:hidden_gems/ui/wigets/logo_widget.dart';
import 'package:hidden_gems/ui/wigets/password_text_field.dart';
import 'package:hidden_gems/ui/wigets/responsive_center_scrollable.dart';
import 'package:hidden_gems/ui/constants/colors.dart';
import 'package:hidden_gems/ui/wigets/social_media_buttons.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        backgroundColor: authBackgroundColor,
        body: ResponsiveCenterScrollable(
          maxContentWidth: 400,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 32),
                const SignInUpHeader(text: "Sign up"),
                const SizedBox(height: 32),
                Flexible(child: EmailTextField(_emailController)),
                const SizedBox(height: 16),
                Flexible(
                    child: PasswordTextField(_passwordController,
                        labelText: 'Password')),
                const SizedBox(height: 16),
                Flexible(
                    child: PasswordTextField(_confirmPasswordController,
                        labelText: 'Confirm Password')),
                const SizedBox(height: 24),
                const LoginButton(
                  buttonText: "Sign up",
                ),
                const SizedBox(height: 24),
                const SignInUpDivider(
                  text: "Sign up with",
                ),
                const SizedBox(height: 16),
                const LoginButton(buttonText: 'Sign Up'),
                const SocialMediaButtons(),
                const SizedBox(height: 32),
                const SignUpInText(
                  preText: "Have an acount",
                  linkText: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
