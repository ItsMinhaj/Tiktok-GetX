import 'package:get/get.dart';
import 'package:tiktok_getx/routes/routes.dart';
import 'package:tiktok_getx/views/screens/auth/login_screen.dart';
import 'package:tiktok_getx/views/screens/auth/singup_screen.dart';

class AppRoutes {
  static List<GetPage> pagesRoute = [
    GetPage(name: loginRoute, page: () => const LoginScreen()),
    GetPage(name: registerRoute, page: () => const SignupScreen()),
  ];
}
