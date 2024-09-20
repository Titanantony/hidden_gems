import 'package:get/get.dart';
import 'package:hidden_gems/ui/screens/homepage/explore_page.dart';
import 'package:hidden_gems/ui/screens/first_page.dart';
import 'package:hidden_gems/ui/screens/homepage/homePage.dart';
import 'package:hidden_gems/ui/screens/sign_in_screen.dart';
import 'package:hidden_gems/ui/screens/sign_up_screen.dart';

class Routes {
  static var routes = [
    GetPage(name: "/First-Page", page: () => const FirstPage()),
    GetPage(name: "/Sign-In", page: () => const LoginScreen()),
    GetPage(name: "/Sign-Up", page: () => const SignUpScreen()),
    GetPage(name: "/Home-Page", page: () => const HomePage()),
    GetPage(
        name: "/Explore-page",
        page: () => ExplorePage(factory: FirebaseExplorePageFactory())),
  ];
}
