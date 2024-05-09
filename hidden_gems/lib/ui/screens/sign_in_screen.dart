import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hidden_gems/ui/wigets/email_text_field.dart';
import 'package:hidden_gems/ui/wigets/forgot_password_text.dart';
import 'package:hidden_gems/ui/wigets/login_button.dart';
import 'package:hidden_gems/ui/wigets/signin_up_header.dart';
import 'package:hidden_gems/ui/wigets/logo_widget.dart';
import 'package:hidden_gems/ui/wigets/password_text_field.dart';
import 'package:hidden_gems/ui/wigets/responsive_center_scrollable.dart';
import 'package:hidden_gems/ui/wigets/sign_in_up_divider.dart';
import 'package:hidden_gems/ui/wigets/sign_up_in_text.dart';
import 'package:hidden_gems/ui/wigets/social_media_buttons.dart';
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
                const SignInUpHeader(),
                const SizedBox(height: 32),
                Flexible(child: EmailTextField(_usernameController)),
                const SizedBox(height: 16),
                Flexible(child: PasswordTextField(_passwordController)),
                const SizedBox(height: 24),
                const LoginButton(),
                const SizedBox(height: 16),
                const ForgotPasswordText(),
                const SizedBox(height: 32),
                const SignInUpDivider(),
                const SizedBox(height: 16),
                const SocialMediaButtons(),
                const SizedBox(height: 16),
                SignUpInText(
                  onTap: signUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    Get.offAndToNamed("/Sign-Up");
  }
}
