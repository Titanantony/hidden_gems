import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_gems/ui/utils/signup_google.dart';
import 'package:hidden_gems/ui/utils/sigup_funtion.dart';
import 'package:hidden_gems/ui/constants/colors.dart';
import 'package:hidden_gems/ui/widgets/authentication/email_text_field.dart';
import 'package:hidden_gems/ui/widgets/authentication/login_button.dart';
import 'package:hidden_gems/ui/widgets/authentication/logo_widget.dart';
import 'package:hidden_gems/ui/widgets/authentication/password_text_field.dart';
import 'package:hidden_gems/ui/widgets/authentication/responsive_center_scrollable.dart';
import 'package:hidden_gems/ui/widgets/authentication/sign_in_up_divider.dart';
import 'package:hidden_gems/ui/widgets/authentication/sign_up_in_text.dart';
import 'package:hidden_gems/ui/widgets/authentication/signin_up_header.dart';
import 'package:hidden_gems/ui/widgets/authentication/social_media_buttons.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _username = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool validatePasswords(String password, String confirmPassword) {
    return password == confirmPassword;
  }

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
                Flexible(
                    child: EmailTextField(
                  _username,
                  labelText: "Enter username",
                  prefixIcon: const Icon(Icons.person, color: authTextColor),
                )),
                const SizedBox(height: 16),
                Flexible(child: EmailTextField(emailController)),
                const SizedBox(height: 16),
                Flexible(
                    child: PasswordTextField(passwordController,
                        labelText: 'Password')),
                const SizedBox(height: 16),
                Flexible(
                  child: PasswordTextField(_confirmPasswordController,
                      labelText: 'Confirm Password'),
                ),
                const SizedBox(height: 24),
                LoginButton(
                  buttonText: "Sign up",
                  onPressed: () {
                    final password = passwordController.text;
                    final confirmPassword = _confirmPasswordController.text;

                    if (validatePasswords(password, confirmPassword)) {
                      firebaseSignup(emailController.text, password, context);
                    } else {
                      // Show an error message or dialog indicating that the passwords don't match
                      showErrorDialog(context, 'Passwords do not match');
                    }
                  },
                ),
                const SizedBox(height: 24),
                const SignInUpDivider(
                  text: "Sign up with",
                ),
                const SizedBox(height: 16),
                SocialMediaButtons(
                  onGoogleSignInPressed: () {
                    final signUpWithGoogleScreen = SignUpWithGoogleScreen();
                    signUpWithGoogleScreen.initiateGoogleSignUp();
                  },
                ),
                const SizedBox(height: 32),
                SignUpInText(
                  preText: "Have an acount? ",
                  linkText: 'Sign In',
                  onTap: signIn,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    Get.offAndToNamed("/Sign-In");
  }
}
