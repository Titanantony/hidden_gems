import 'package:flutter/material.dart';
import 'package:hidden_gems/ui/screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        fontFamily: 'Calibri', // Sans-serif font
      ),
      home: const LoginScreen(),
    );
  }
}
