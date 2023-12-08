import 'controller/signin_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/core/utils/validation_functions.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/domain/googleauth/google_auth_helper.dart';
import 'package:artohmapp/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SigninScreen extends GetWidget<SigninController> {
  SigninScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
            leadingWidth: 46.h,
            leading: AppbarImage(
                svgPath: ImageConstant.imgArrowleftRed300,
                margin: EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            title: AppbarSubtitle(
                text: "lbl_hello_again".tr,
                margin: EdgeInsets.only(left: 36.h, top: 43.v, bottom: 16.v)),
            actions: [
              AppbarImage1(
                  svgPath: ImageConstant.imgMask,
                  margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v))
            ],
            styleType: Style.bgOutline),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 15.h, top: 64.v, right: 15.h),
              child: Column(
                children: [
                  CustomOutlinedButton(
                      height: 56.v,
                      text: "msg_continue_with_google".tr,
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 30.h),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgGooglelogo)),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
                      buttonTextStyle: CustomTextStyles.titleMediumLatoRed300,
                      onTap: () {
                        onTapContinuewith();
                      }),
                  SizedBox(height: 16.v),
                  CustomElevatedButton(
                      height: 56.v,
                      text: "msg_continue_with_facebook".tr,
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 30.h),
                          child: CustomImageView(
                              svgPath:
                                  ImageConstant.imgProfileiconsWhiteA70020x20)),
                      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                      buttonTextStyle: CustomTextStyles.titleMediumLatoWhiteA700,
                      onTap: () {
                        onTapContinuewith1();
                      }),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 26.v, right: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_full_name".tr,
                                style: CustomTextStyles.titleMediumLato),
                            SizedBox(height: 5.v),
                            CustomTextFormField(
                                controller: controller.fullNameController,
                                hintText: "msg_enter_your_full".tr,
                                validator: (value) {
                                  if (!isText(value)) {
                                    return "Please enter valid text";
                                  }
                                  return null;
                                })
                          ])),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 26.v, right: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_email_address".tr,
                                style: CustomTextStyles.titleMediumLato),
                            SizedBox(height: 5.v),
                            CustomTextFormField(
                                controller: controller.emailController,
                                hintText: "msg_enter_your_email".tr,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value, isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                })
                          ])),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 12.h, top: 26.v, right: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("lbl_password".tr,
                                style: CustomTextStyles.titleMediumLato),
                            SizedBox(height: 5.v),
                            Obx(() => CustomTextFormField(
                                controller: controller.passwordController,
                                hintText: "msg_enter_your_password".tr,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword.value =
                                          !controller.isShowPassword.value;
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(12.h),
                                        child: CustomImageView(
                                            svgPath: controller
                                                    .isShowPassword.value
                                                ? ImageConstant.imgLightbulb
                                                : ImageConstant.imgLightbulb))),
                                suffixConstraints:
                                    BoxConstraints(maxHeight: 36.v),
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidPassword(value,
                                          isRequired: true))) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                obscureText: controller.isShowPassword.value,
                                contentPadding: EdgeInsets.only(
                                    left: 12.h, top: 9.v, bottom: 9.v)))
                          ])),
                  SizedBox(height: 16.v),
                  CustomElevatedButton(
                      height: 42.v,
                      text: "lbl_login".tr,
                      buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumRobotoWhiteA700,
                      onTap: () {
                        onTapLogin();
                      }),
                  SizedBox(height: 16.v),
                  CustomOutlinedButton(
                      height: 42.v,
                      text: "lbl_forgot_password".tr,
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL81,
                      buttonTextStyle: CustomTextStyles.titleMediumRobotoPrimary,
                      onTap: () {
                        onTapForgotpassword();
                      }),
                  Padding(
                    padding: EdgeInsets.fromLTRB(47.h, 25.v, 47.h, 5.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 2.v),
                            child: Text("msg_don_t_have_an_account".tr,
                                style: CustomTextStyles.bodyLargeRoboto)),
                        CustomOutlinedButton(
                          height: 22.v,
                          width: 84.h,
                          text: "lbl_create_one".tr,
                          margin: EdgeInsets.only(left: 16.h),
                          buttonStyle: CustomButtonStyles.outlineLightBlueA,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumRobotoLightblueA700,
                          onTap: () {
                            onTapCreateone();
                          },
                        ),
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

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapContinuewith() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Performs a Facebook sign-in and returns a [FacebookUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Facebook sign-in process fails.
  onTapContinuewith1() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Navigates to the artDiscoveryContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artDiscoveryContainerScreen.
  onTapLogin() {
    Get.toNamed(
      AppRoutes.artDiscoveryContainerScreen,
    );
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the forgotPasswordScreen.
  onTapForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupScreen.
  onTapCreateone() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
