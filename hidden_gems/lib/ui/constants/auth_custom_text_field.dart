import 'package:flutter/material.dart';

class AuthCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;
  final bool isPassword;

  const AuthCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.prefixIcon,
    this.isPassword = false,
  });

  @override
  AuthCustomTextFieldState createState() => AuthCustomTextFieldState();
}

class AuthCustomTextFieldState extends State<AuthCustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscureText : widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Color(0xff9f6a4a)),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
