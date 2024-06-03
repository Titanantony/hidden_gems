import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hidden_gems/ui/utils/sigup_funtion.dart';

class SignUpWithGoogleScreen extends StatefulWidget {
  const SignUpWithGoogleScreen({super.key});

  @override
  _SignUpWithGoogleScreenState createState() => _SignUpWithGoogleScreenState();
  // Add this public method
  void initiateGoogleSignUp() {
    _SignUpWithGoogleScreenState state = _SignUpWithGoogleScreenState();
    state.signUpWithGoogle();
  }
}

class _SignUpWithGoogleScreenState extends State<SignUpWithGoogleScreen> {
  Future<void> signUpWithGoogle() async {
    try {
      // Initialize Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the authentication details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential for Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign up with Firebase using the Google credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Handle successful sign-up
      if (mounted) {
        showSuccessDialog(context, 'Sign-up successful!');
        Get.offAllNamed('/Home-Page');
      }
    } catch (e) {
      // Handle sign-up errors
      if (mounted) {
        showErrorDialog(
            context, 'Error signing up with Google: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return your widget tree here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up with Google'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: signUpWithGoogle,
          child: const Text('Sign Up with Google'),
        ),
      ),
    );
  }
}
