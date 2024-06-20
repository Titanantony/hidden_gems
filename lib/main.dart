import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_gems/firebase_options.dart';
import 'package:hidden_gems/routes.dart'; // Import your routes file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Screen',
      theme: ThemeData(
        fontFamily: 'Calibri', // Sans-serif font
      ),
      initialRoute: '/First-Page', // Set the initial route
      getPages: Routes.routes, // Pass the routes from your routes file
    );
  }
}
