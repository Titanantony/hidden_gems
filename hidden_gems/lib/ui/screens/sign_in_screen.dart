import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:sign_in_button/sign_in_button.dart';
import 'package:hidden_gems/ui/constants/auth_custom_button.dart';
import 'package:hidden_gems/ui/constants/auth_custom_text_field.dart';
import 'package:hidden_gems/ui/constants/colors.dart';

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
    return Scaffold(
      backgroundColor: authBackgroundColor, // Background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: authTextColor, // Text color
            ),
          ),
          const SizedBox(height: 32),
          AuthCustomTextField(
            controller: _usernameController,
            hintText: 'Enter username',
            prefixIcon: const Icon(Icons.person, color: authTextColor),
          ),
          const SizedBox(height: 16),
          AuthCustomTextField(
            controller: _passwordController,
            hintText: 'Enter password',
            obscureText: true,
            prefixIcon: const Icon(Icons.lock, color: authTextColor),
          ),
          const SizedBox(height: 24),
          AuthCustomButton(
            text: 'Login',
            color: authButtonColor, // Button color
            width: 200, // Set the width to double.infinity
            height: 50,
            onPressed: () {
              // Implement login logic here
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Forgot your password?',
            style: TextStyle(
              color: linkColor, // Text color
            ),
          ),
          const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  thickness: 1.0, // Adjust the thickness of the line
                  color: Colors.grey, // Set the color of the line
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sign in with',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SignInButton(
                  Buttons.facebook,
                  text: 'Facebook',
                  onPressed: () {
                    // Facebook sign-in logic
                  },
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SignInButton(
                  Buttons.google,
                  text: 'Google',
                  onPressed: () {
                    // Google sign-in logic
                  },
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color:
                        authTextlinkColor, // Set the color for "Don't have an account?"
                  ),
                ),
                TextSpan(
                  text: "Sign up",
                  style: TextStyle(
                    color: linkColor, // Set the color for "Sign up"
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
