import 'package:get/get.dart';
import 'package:tiktok_getx/dependency/dependency.dart';
import 'package:tiktok_getx/routes/routes.dart';
import 'package:tiktok_getx/views/screens/auth/login_screen.dart';
import 'package:tiktok_getx/views/screens/auth/singup_screen.dart';

import '../views/screens/home/home_screen.dart';

class AppRoutes {
  static final List<GetPage> pagesRoute = [
    GetPage(
      name: loginRoute,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: registerRoute,
      page: () => const SignupScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(name: homeRoute, page: () => const HomeScreen())
  ];
}
