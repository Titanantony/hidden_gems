import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenH = mediaQuery.size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/2f_page.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSkipButton(),
                    const Spacer(flex: 2),
                    _buildTitleText(),
                    const SizedBox(height: 20.0),
                    _buildDescriptionText(),
                    const Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomContainer(screenWidth, screenH),
        ],
      ),
    );
  }

  Align _buildSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed('/Home-Page');
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent, // foreground
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text('Skip'),
      ),
    );
  }

  Text _buildTitleText() {
    return const Text(
      'Explore Nairobi\nwith us',
      style: TextStyle(
        color: Colors.white,
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _buildDescriptionText() {
    return const Text(
      'Discover Nairobi\'s vibrant culture, wildlife, and cuisine, a city of endless wonders.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }

  Align _buildBottomContainer(double screenWidth, screenH) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: screenWidth,
        height: screenH * 0.2,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildGetStartedButton(),
            const SizedBox(height: 30.0),
            _buildLoginRow(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildGetStartedButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed('/Sign-In');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black, // foreground
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Let\'s Get Started',
            style: TextStyle(fontSize: 16.0),
          ),
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }

  Row _buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: 'Do you already have an account? ',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              TextSpan(
                text: 'Login',
                style: const TextStyle(
                  color: Colors.blue, // Make it look like a link
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed('/Sign-In');
                  },
              ),
            ],
          ),
        )),
      ],
    );
  }
}
