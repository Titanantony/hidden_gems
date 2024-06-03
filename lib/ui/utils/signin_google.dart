import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hidden_gems/ui/utils/sigup_funtion.dart';

Future<void> signInWithGoogle(BuildContext context) async {
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

    // Sign in with Firebase using the Google credential
    await FirebaseAuth.instance.signInWithCredential(credential);

    // Handle successful sign-in
    Get.offAllNamed('/Home-Page');
  } catch (e) {
    // Handle sign-in errors
    showErrorDialog(context, 'Error signing in with Google: ${e.toString()}');
  }
}
