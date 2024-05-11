import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<void> firebaseSignup(String emailController, String passwordController,
    BuildContext context) async {
  try {
    // Input validation
    if (emailController.isEmpty || passwordController.isEmpty) {
      showErrorDialog(context, 'Please enter email and password.');
      return;
    }

    // Regular expression to validate email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(emailController)) {
      showErrorDialog(context, 'Please enter a valid email address.');
      return;
    }

    // Password validation
    if (passwordController.length < 6) {
      showErrorDialog(context, 'Password must be at least 6 characters long.');
      return;
    }

    // Show loading indicator
    showLoadingDialog(context);

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController,
      password: passwordController,
    );

    // Handle successful sign-up
    Navigator.of(context).pop(); // Close loading dialog
    showSuccessDialog(context, 'Sign-up successful!');
    showSuccessDialog(context, 'Sign-up successful!');
  } on FirebaseAuthException catch (e) {
    // Handle Firebase Authentication errors
    Navigator.of(context).pop(); // Close loading dialog
    showErrorDialog(context, getErrorMessage(e.code));
  } catch (e) {
    // Handle other errors
    Navigator.of(context).pop(); // Close loading dialog
    showErrorDialog(context, 'An error occurred. Please try again later.');
  }
}

String getErrorMessage(String errorCode) {
  // Map Firebase Authentication error codes to user-friendly messages
  switch (errorCode) {
    case 'email-already-in-use':
      return 'The email address is already in use by another account.';
    case 'invalid-email':
      return 'The email address is not valid.';
    case 'weak-password':
      return 'The password is too weak.';
    default:
      return 'An error occurred. Please try again later.';
  }
}

void showErrorDialog(BuildContext context, String message) {
  // Show an error dialog with the provided message
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

void showLoadingDialog(BuildContext context) {
  // Show a loading dialog
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.0),
              Text('Loading...'),
            ],
          ),
        ),
      );
    },
  );
}

void showSuccessDialog(BuildContext context, String message) {
  // Show a success dialog with the provided message
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed('/Home-Page');
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
