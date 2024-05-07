import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/constants/auth_custom_button.dart';
import 'package:hidden_gems/ui/constants/auth_custom_text_field.dart';
import 'package:hidden_gems/ui/constants/auth_social_media_button.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onPressed: () {
                // Implement login logic here
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Forgot your password?',
              style: TextStyle(
                color: Color(0xff5a4740), // Text color
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthSocialMediaButton(
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  color: authSecodaryButtonColor, // Button color
                  onPressed: () {
                    // Implement Facebook login logic
                  },
                ),
                const SizedBox(width: 16),
                AuthSocialMediaButton(
                  icon: const Icon(Icons.facebook_rounded, color: Colors.white),
                  color: authSecodaryButtonColor, // Button color
                  onPressed: () {
                    // Implement Twitter login logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Don\'t have an account? Sign up',
              style: TextStyle(
                color: authTextlinkColor, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
