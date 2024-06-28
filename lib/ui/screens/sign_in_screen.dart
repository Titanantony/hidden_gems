import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hidden_gems/ui/utils/signin_google.dart';
import 'package:hidden_gems/ui/constants/colors.dart';
import 'package:hidden_gems/ui/wigets/authentication/email_text_field.dart';
import 'package:hidden_gems/ui/wigets/authentication/forgot_password_text.dart';
import 'package:hidden_gems/ui/wigets/authentication/login_button.dart';
import 'package:hidden_gems/ui/wigets/authentication/logo_widget.dart';
import 'package:hidden_gems/ui/wigets/authentication/password_text_field.dart';
import 'package:hidden_gems/ui/wigets/authentication/responsive_center_scrollable.dart';
import 'package:hidden_gems/ui/wigets/authentication/sign_in_up_divider.dart';
import 'package:hidden_gems/ui/wigets/authentication/sign_up_in_text.dart';
import 'package:hidden_gems/ui/wigets/authentication/signin_up_header.dart';
import 'package:hidden_gems/ui/wigets/authentication/social_media_buttons.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoWidget(),
                  const SizedBox(height: 32),
                  const SignInUpHeader(),
                  const SizedBox(height: 32),
                  Flexible(
                      child: EmailTextField(
                    _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _emailController.text = value!;
                    },
                  )),
                  const SizedBox(height: 16),
                  Flexible(
                      child: PasswordTextField(
                    _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _passwordController.text = value!;
                    },
                  )),
                  const SizedBox(height: 24),
                  LoginButton(onPressed: _submit),
                  const SizedBox(height: 16),
                  const ForgotPasswordText(),
                  const SizedBox(height: 32),
                  const SignInUpDivider(),
                  const SizedBox(height: 16),
                  SocialMediaButtons(
                    onGoogleSignInPressed: () {
                      signInWithGoogle;
                    },
                  ),
                  const SizedBox(height: 16),
                  SignUpInText(
                    onTap: signUp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed('/Home-Page'); // Navigate to the HomePage
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signUp() {
    Get.offAndToNamed("/Sign-Up");
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      login();
    }
  }
}
