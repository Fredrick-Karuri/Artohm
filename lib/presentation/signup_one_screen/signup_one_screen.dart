import 'controller/signup_one_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/core/utils/validation_functions.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SignupOneScreen extends GetWidget<SignupOneController> {
  SignupOneScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 46.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftRed300,
                    margin:
                        EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
                    onTap: () {
                      onTapArrowleftone();
                    }),
                title: AppbarSubtitle(
                    text: "lbl_welcome_aboard".tr,
                    margin:
                        EdgeInsets.only(left: 35.h, top: 41.v, bottom: 18.v)),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgMask,
                      margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v))
                ],
                styleType: Style.bgOutline),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 24.v),
                    child: Column(children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgWelcomeamico,
                          height: 160.adaptSize,
                          width: 160.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 12.h, top: 34.v, right: 12.h),
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
                          padding: EdgeInsets.only(
                              left: 12.h, top: 34.v, right: 12.h),
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
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    })
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 12.h, top: 34.v, right: 12.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_password".tr,
                                    style: CustomTextStyles.titleMediumLato),
                                SizedBox(height: 5.v),
                                Obx(() => CustomTextFormField(
                                    controller: controller.passwordController,
                                    hintText: "msg_enter_your_password".tr,
                                    textInputType:
                                        TextInputType.visiblePassword,
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
                                                    : ImageConstant
                                                        .imgLightbulb))),
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
                                    obscureText:
                                        controller.isShowPassword.value,
                                    contentPadding: EdgeInsets.only(
                                        left: 12.h, top: 9.v, bottom: 9.v)))
                              ])),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 12.h, top: 34.v, right: 12.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("msg_confirm_password".tr,
                                    style: CustomTextStyles.titleMediumLato),
                                SizedBox(height: 5.v),
                                Obx(() => CustomTextFormField(
                                    controller:
                                        controller.confirmpasswordController,
                                    hintText: "msg_re_enter_your_password".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    suffix: InkWell(
                                        onTap: () {
                                          controller.isShowPassword1.value =
                                              !controller.isShowPassword1.value;
                                        },
                                        child: Container(
                                            margin: EdgeInsets.all(12.h),
                                            child: CustomImageView(
                                                svgPath: controller
                                                        .isShowPassword1.value
                                                    ? ImageConstant.imgLightbulb
                                                    : ImageConstant
                                                        .imgLightbulb))),
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
                                    obscureText:
                                        controller.isShowPassword1.value,
                                    contentPadding: EdgeInsets.only(
                                        left: 12.h, top: 9.v, bottom: 9.v)))
                              ])),
                      SizedBox(height: 56.v),
                      CustomElevatedButton(
                          height: 42.v,
                          text: "lbl_create_account".tr,
                          buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumRobotoWhiteA700,
                          onTap: () {
                            onTapCreateaccount();
                          }),
                      SizedBox(height: 5.v)
                    ])))));
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
