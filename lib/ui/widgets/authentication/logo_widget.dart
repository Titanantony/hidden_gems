import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/hidden_gems_logo.png',
      height: MediaQuery.of(context).size.height * 0.15,
      fit: BoxFit.contain,
    );
  }
}
