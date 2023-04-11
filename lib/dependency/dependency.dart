import 'package:get/get.dart';

import 'package:tiktok_getx/controllers/login_controller.dart';
import 'package:tiktok_getx/controllers/registration_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }
}
// 