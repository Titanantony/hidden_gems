import 'package:flutter/material.dart';

class SignInUpDivider extends StatelessWidget {
  final String text;

  const SignInUpDivider({super.key, this.text = "Sign in with"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
