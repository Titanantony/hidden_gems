import 'package:flutter/material.dart';

class AuthCustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final double? height;
  final double? width; // Add the width parameter

  const AuthCustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.width = double.infinity, // Add the width parameter
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Use the provided width parameter
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
