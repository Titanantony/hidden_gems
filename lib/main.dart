import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidden_gems/ui/screens/homepage/locationProvider.dart';
import 'package:provider/provider.dart';
import 'package:hidden_gems/firebase_options.dart';
import 'package:hidden_gems/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hidden Gems',
      theme: ThemeData(
        fontFamily: 'Calibri', // Sans-serif font
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/First-Page', // Set the initial route
      getPages: Routes.routes, // Pass the routes from your routes file
    );
  }
}
