import 'package:artohmapp/main.dart';
import '../../widgets/custom_appbar_component.dart';
import 'controller/settings_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<bool> signOut() async {
  final storage = new FlutterSecureStorage();
  await storage.delete(key: 'accessToken');
  return false;
}

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBarComponent(
          title: "lbl_settings".tr,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 32.v),
          child: Column(
            children: [
              header(),
              notifications(),
              privacy(),
              terms(),
              help(),
              policy(),
              SizedBox(height: 48.v),
              Column(
                children: [
                  CustomOutlinedButton(
                      text: "lbl_contact_support".tr,
                      buttonTextStyle: CustomTextStyles.titleSmallLatoRed300),
                  SizedBox(height: 24.v),
                  CustomElevatedButton(
                    text: "Logout".tr,
                    buttonTextStyle: CustomTextStyles.titleSmallLatoWhiteA700,
                    onTap: onTapLogout,

                    // onTap: () async {
                    //   bool isLoggedIn = await signOut();
                    //   if (!isLoggedIn) {
                    //     Get.toNamed(AppRoutes.signinScreen);
                    //   }
                    // },
                  ),
                ],
              ),
              SizedBox(height: 5.v)
            ],
          ),
        ),
      ),
    );
  }

  policy() {
    return Container(
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
        ],
      ),
    );
  }

  help() {
    return Container(
      margin: EdgeInsets.only(top: 28.v, right: 9.h),
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.outlineBlack90001,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 3.v, bottom: 8.v),
              child: Text("lbl_help".tr, style: theme.textTheme.titleMedium)),
          CustomImageView(
              svgPath: ImageConstant.imgArrowright,
              height: 24.v,
              width: 12.h,
              margin: EdgeInsets.only(bottom: 8.v))
        ],
      ),
    );
  }

  terms() {
    return Container(
      margin: EdgeInsets.only(top: 28.v, right: 9.h),
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.outlineBlack90001,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v, bottom: 10.v),
              child: Text("msg_terms_and_conditions".tr,
                  style: theme.textTheme.titleMedium)),
          CustomImageView(
              svgPath: ImageConstant.imgArrowright,
              height: 24.v,
              width: 12.h,
              margin: EdgeInsets.only(bottom: 8.v))
        ],
      ),
    );
  }

  privacy() {
    return GestureDetector(
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
                padding: EdgeInsets.only(top: 3.v, bottom: 8.v),
                child: Text("msg_privacy_settings".tr,
                    style: theme.textTheme.titleMedium)),
            CustomImageView(
              svgPath: ImageConstant.imgArrowright,
              height: 24.v,
              width: 12.h,
              margin: EdgeInsets.only(bottom: 8.v),
            ),
          ],
        ),
      ),
    );
  }

  notifications() {
    return GestureDetector(
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
                padding: EdgeInsets.only(top: 1.v, bottom: 10.v),
                child: Text("lbl_notifications2".tr,
                    style: theme.textTheme.titleMedium)),
            CustomImageView(
                svgPath: ImageConstant.imgArrowright,
                height: 24.v,
                width: 12.h,
                margin: EdgeInsets.only(bottom: 8.v))
          ],
        ),
      ),
    );
  }

  header() {
    return Container(
      padding: EdgeInsets.only(left: 11.h, top: 8.v, bottom: 8.v),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // border radius
        border: Border.all(
          color: Color.fromRGBO(255, 107, 136, 0.50), // border color
          width: 1, // border width
        ),
        color: Color.fromRGBO(255, 107, 136, 0.20), // background color
      ),
      child: Row(
        children: [
          Text(
            "msg_account_settings".tr,
            style: CustomTextStyles.titleMediumLato,
          ),
          Expanded(
              child:
                  SizedBox()), // This will push the image to the end of the row
          Container(
            margin: EdgeInsets.fromLTRB(30.h, 16.v, 12.h, 16.v),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgProfile,
              height: 40.adaptSize,
              width: 40.adaptSize,
            ),
          ),
        ],
      ),
    );
  }

  // logout of the application

  onTapLogout() async {
    Get.defaultDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
      titlePadding: EdgeInsets.only(
        top: 16.v,
      ),
      title: "Confirm Logout",
      titleStyle: CustomTextStyles.titleLargeBlack90001,
      middleText: "Are you sure you want to logout?".tr,
      textConfirm: "Yes".tr,
      textCancel: "Cancel".tr,
      confirmTextColor: Colors.white,
      buttonColor: appTheme.red300,
      cancelTextColor: appTheme.red300,
      backgroundColor: appTheme.pink50,
      onConfirm: () async {
        bool isLoggedIn = await signOut();
        if (!isLoggedIn) {
          Get.offAllNamed(AppRoutes.signinScreen);
          await supabase.auth.signOut();
        }
      },
      onCancel: () {},
    );
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
