import 'package:get/get.dart';
import 'package:tiktok_getx/controllers/login_controller.dart';
import 'package:tiktok_getx/controllers/registration_controller.dart';

class Dependency {
  static Future<void> init() async {
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => LoginController());
  }
}
