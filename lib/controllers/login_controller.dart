import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../utilies/error_show_dialog.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> loginUser(String? email, String? password) async {
    isLoading.value = true;
    try {
      if (email != null && password != null) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.snackbar("", "Your'e logged in.");
      }
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        await errorShowDialog("Error: User Not Found");
      } else if (e.code == "wrong-password") {
        await errorShowDialog("Error: Wrong Password");
      } else {
        await errorShowDialog(e.code);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      await errorShowDialog(e.toString());
    }
  }
}
