import 'package:flutter/material.dart';

class AuthSocialMediaButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final VoidCallback onPressed;

  const AuthSocialMediaButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
      child: icon,
    );
  }
}
