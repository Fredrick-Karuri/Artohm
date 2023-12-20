import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/apiClient/api_client.dart';
import '../../widgets/onboarding_appbar.dart';
import 'controller/signup_one_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/core/utils/validation_functions.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore_for_file: must_be_immutable
class SignupOneScreen extends GetWidget<SignupOneController> {
  SignupOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: OnboardingAppBar(
          text: 'Welcome Aboard',
          showLeadingIcon: true,
          showText: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 24.v),
              child: Column(
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgWelcomeamico,
                    height: 240.adaptSize,
                    width: 240.adaptSize,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Column(
                      children: [
                        name(),
                        email(),
                        password(),
                        confirmPassword(),
                        SizedBox(height: 48.v),
                        btn(),
                        SizedBox(height: 5.v)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  btn() {
    return CustomElevatedButton(
      height: 42.v,
      text: "lbl_create_account".tr,
      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
      buttonTextStyle: CustomTextStyles.titleMediumRobotoWhiteA700,
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          // If all data are correct then save data to out variables
          _formKey.currentState!.save();

          // Here we will send the data to the server
          var response = await Get.find<ApiClient>().registerUser(
            controller.fullNameController.text,
            controller.emailController.text,
            controller.passwordController.text,
          );

          if (response.statusCode == 201) {
            // If the server returns a 200 OK response, then parse the JSON.

            onTapCreateaccount();
            var jsonResponse = jsonDecode(response.body);
            // print(jsonResponse);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt('userId', jsonResponse['user_id']);
            Get.dialog(
              AlertDialog(
                title: Text("Success"),
                content: Text("Your account has been created successfully"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("OK"),
                  )
                ],
              ),
            );
            // You can now use the jsonResponse to create a user session.
            // This will depend on how your backend server is set up.
          } else {
            print('Status code: ${response.statusCode}');
            print('Response body: ${response.body}');
            Get.dialog(
              AlertDialog(
                title: Text("Error"),
                content: Text("Something went wrong"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("OK"),
                  )
                ],
              ),
            );
            // If the server returns an error response, you can handle it here.
            // You might want to show an error message to the user.
          }
        }
      },
    );
  }

  confirmPassword() {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("msg_confirm_password".tr,
              style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          Obx(() => CustomTextFormField(
              controller: controller.confirmPasswordController,
              focusNode: controller.confirmPasswordFocusNode,
              hintText: "msg_re_enter_your_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: InkWell(
                onTap: () {
                  controller.isShowPassword1.value =
                      !controller.isShowPassword1.value;
                },
                child: Container(
                  margin: EdgeInsets.all(12.h),
                  child: CustomImageView(
                      svgPath: controller.isShowPassword1.value
                          ? ImageConstant.imgLightbulb
                          : ImageConstant.imgLightbulb),
                ),
              ),
              suffixConstraints: BoxConstraints(maxHeight: 36.v),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                } else if (value != controller.passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              obscureText: controller.isShowPassword1.value,
              contentPadding:
                  EdgeInsets.only(left: 12.h, top: 9.v, bottom: 9.v)))
        ],
      ),
    );
  }

  password() {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_password".tr, style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          Obx(() => CustomTextFormField(
              controller: controller.passwordController,
              focusNode: controller.passwordFocusNode,
              hintText: "msg_enter_your_password".tr,
              textInputType: TextInputType.visiblePassword,
              suffix: InkWell(
                  onTap: () {
                    controller.isShowPassword.value =
                        !controller.isShowPassword.value;
                  },
                  child: Container(
                      margin: EdgeInsets.all(12.h),
                      child: CustomImageView(
                          svgPath: controller.isShowPassword.value
                              ? ImageConstant.imgLightbulb
                              : ImageConstant.imgLightbulb))),
              suffixConstraints: BoxConstraints(maxHeight: 36.v),
              validator: (value) {
                String? error = isValidPassword(value);
                if (error != null) {
                  return error;
                }
                return null;
              },
              obscureText: controller.isShowPassword.value,
              contentPadding:
                  EdgeInsets.only(left: 12.h, top: 9.v, bottom: 9.v)))
        ],
      ),
    );
  }

  email() {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_email_address".tr, style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          CustomTextFormField(
            controller: controller.emailController,
            focusNode: controller.emailFocusNode,
            hintText: "msg_enter_your_email".tr,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              String? error = isValidEmail(value);
              if (error != null) {
                return error;
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  name() {
    return Padding(
      padding: EdgeInsets.only(
        top: 32.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_full_name".tr, style: CustomTextStyles.titleMediumLato),
          SizedBox(height: 5.v),
          CustomTextFormField(
            controller: controller.fullNameController,
            focusNode: controller.fullNameFocusNode,
            hintText: "msg_enter_your_full".tr,
            validator: (value) {
              String? error = isText(value);
              if (error != null) {
                return error;
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the artDiscoveryContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artDiscoveryContainerScreen.
  onTapCreateaccount() {
    Get.toNamed(
      AppRoutes.artDiscoveryContainerScreen,
    );
  }
}
