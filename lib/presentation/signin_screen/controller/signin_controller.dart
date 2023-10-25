import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signin_screen/models/signin_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SigninScreen.
///
/// This class manages the state of the SigninScreen, including the
/// current signinModelObj
class SigninController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SigninModel> signinModelObj = SigninModel().obs;

  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
