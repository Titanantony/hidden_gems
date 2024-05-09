import 'package:get/get.dart';
import 'package:hidden_gems/ui/screens/sign_in_screen.dart';
import 'package:hidden_gems/ui/screens/sign_up_screen.dart';

class Routes {
  static var routes = [
    GetPage(name: "/Sign-In", page: () => const LoginScreen()),
    GetPage(name: "/Sign-Up", page: () => const SignUpScreen()),
  ];
}
