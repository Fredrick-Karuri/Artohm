import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/signup_screen/models/signup_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignupOneScreen.
///
/// This class manages the state of the SignupOneScreen, including the
/// current SignupModelObj
class SignupController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  Rx<SignupModel> SignupModelObj = SignupModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  FocusNode fullNameFocusNode =FocusNode();
  FocusNode emailFocusNode =FocusNode();
  FocusNode passwordFocusNode =FocusNode();
  FocusNode confirmPasswordFocusNode =FocusNode();

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }
}
