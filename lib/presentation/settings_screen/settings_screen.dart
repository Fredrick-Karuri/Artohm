import 'controller/settings_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

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
                title: AppbarTitle(
                    text: "lbl_settings".tr,
                    margin:
                        EdgeInsets.only(left: 36.h, top: 41.v, bottom: 15.v)),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgMask,
                      margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v))
                ],
                styleType: Style.bgOutline),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 32.v),
                child: Column(children: [
                  CustomTextFormField(
                      controller: controller.profileController,
                      hintText: "msg_account_settings".tr,
                      hintStyle: CustomTextStyles.titleMediumLato,
                      textInputAction: TextInputAction.done,
                      suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 16.v, 12.h, 16.v),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.h)),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgProfile,
                              height: 40.adaptSize,
                              width: 40.adaptSize)),
                      suffixConstraints: BoxConstraints(maxHeight: 72.v),
                      contentPadding:
                          EdgeInsets.only(left: 11.h, top: 26.v, bottom: 26.v)),
                  GestureDetector(
                      onTap: () {
                        onTapRow();
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 24.v, right: 9.h),
                          padding: EdgeInsets.symmetric(vertical: 8.v),
                          decoration: AppDecoration.outlineBlack90001,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 1.v, bottom: 10.v),
                                    child: Text("lbl_notifications2".tr,
                                        style: theme.textTheme.titleMedium)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: 24.v,
                                    width: 12.h,
                                    margin: EdgeInsets.only(bottom: 8.v))
                              ]))),
                  GestureDetector(
                      onTap: () {
                        onTapRow1();
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 28.v, right: 9.h),
                          padding: EdgeInsets.symmetric(vertical: 8.v),
                          decoration: AppDecoration.outlineBlack90001,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(top: 3.v, bottom: 8.v),
                                    child: Text("msg_privacy_settings".tr,
                                        style: theme.textTheme.titleMedium)),
                                CustomImageView(
                                    svgPath: ImageConstant.imgArrowright,
                                    height: 24.v,
                                    width: 12.h,
                                    margin: EdgeInsets.only(bottom: 8.v))
                              ]))),
                  Container(
                      margin: EdgeInsets.only(top: 28.v, right: 9.h),
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      decoration: AppDecoration.outlineBlack90001,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 1.v, bottom: 10.v),
                                child: Text("msg_terms_and_conditions".tr,
                                    style: theme.textTheme.titleMedium)),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: 24.v,
                                width: 12.h,
                                margin: EdgeInsets.only(bottom: 8.v))
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: 28.v, right: 9.h),
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      decoration: AppDecoration.outlineBlack90001,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v, bottom: 8.v),
                                child: Text("lbl_help".tr,
                                    style: theme.textTheme.titleMedium)),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: 24.v,
                                width: 12.h,
                                margin: EdgeInsets.only(bottom: 8.v))
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: 28.v, right: 9.h),
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      decoration: AppDecoration.outlineBlack90001,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 3.v, bottom: 8.v),
                                child: Text("lbl_privacy_policy".tr,
                                    style: theme.textTheme.titleMedium)),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: 24.v,
                                width: 12.h,
                                margin: EdgeInsets.only(bottom: 8.v))
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: 28.v, right: 9.h),
                      padding: EdgeInsets.symmetric(vertical: 8.v),
                      decoration: AppDecoration.outlineBlack90001,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 1.v, bottom: 10.v),
                                child: Text("msg_terms_and_conditions".tr,
                                    style: theme.textTheme.titleMedium)),
                            CustomImageView(
                                svgPath: ImageConstant.imgArrowright,
                                height: 24.v,
                                width: 12.h,
                                margin: EdgeInsets.only(bottom: 8.v))
                          ])),
                  SizedBox(height: 32.v),
                  CustomOutlinedButton(
                      text: "lbl_contact_support".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallLatoRed300),
                  SizedBox(height: 24.v),
                  CustomElevatedButton(
                      text: "msg_delete_my_account".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallLatoWhiteA700,
                      onTap: () {
                        onTapDeletemy();
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the settingsitemScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the settingsitemScreen.
  onTapRow() {
    Get.toNamed(
      AppRoutes.settingsitemScreen,
    );
  }

  /// Navigates to the privacyScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the privacyScreen.
  onTapRow1() {
    Get.toNamed(
      AppRoutes.privacyScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editProfileScreen.
  onTapDeletemy() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
