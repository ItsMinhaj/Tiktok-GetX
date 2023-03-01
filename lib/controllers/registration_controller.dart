import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilies/error_show_dialog.dart';

class RegistrationController extends GetxController {
  RxBool isLoading = false.obs;
  Future<void> registerUser(
      String? username, String? email, String? password, File? image) async {
    isLoading.value = true;
    try {
      if (username!.isNotEmpty && email!.isNotEmpty && password!.isNotEmpty) {
        final user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Get.snackbar("", "Resitration has been successfull",
            colorText: Colors.white);
      }
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        await errorShowDialog("Email Already In Use");
      } else if (e.code == "weak-password") {
        await errorShowDialog("Weak Password");
      } else if (e.code == "invalid-email") {
        await errorShowDialog("Invalid Email");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      await errorShowDialog(e.toString());
    }
  }
}
