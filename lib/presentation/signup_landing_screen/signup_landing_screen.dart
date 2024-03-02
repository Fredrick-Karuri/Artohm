import 'package:artohmapp/widgets/onboarding_appbar.dart';

import 'controller/signup_landing_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/domain/googleauth/google_auth_helper.dart';
import 'package:artohmapp/domain/facebookauth/facebook_auth_helper.dart';

class SignupScreen extends GetWidget<SignupLandingController> {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: OnboardingAppBar(
          text: 'Welcome Aboard',
          showLeadingIcon: true,
          showText: true,
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 15.h, top: 119.v, right: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomElevatedButton(
                height: 56.v,
                text: "msg_continue_with_email".tr,
                leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child: CustomImageView(svgPath: ImageConstant.imgMail)),
                buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                buttonTextStyle: CustomTextStyles.titleMediumLatoWhite,
                onTap: () {
                  // onTapContinueWithEmail();
            Get.toNamed(AppRoutes.selectAccountTypePage);

                },
              ),
              SizedBox(height: 24.v),
              CustomOutlinedButton(
                height: 56.v,
                text: "msg_continue_with_google".tr,
                leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child:
                        CustomImageView(svgPath: ImageConstant.imgGooglelogo)),
                buttonStyle: CustomButtonStyles.outlinePrimaryTL8,
                buttonTextStyle: CustomTextStyles.titleMediumLatoRed300,
                onTap: () {
                  onTapContinuewith1();
                },
              ),
              SizedBox(height: 24.v),
              CustomElevatedButton(
                height: 56.v,
                text: "msg_continue_with_facebook".tr,
                leftIcon: Container(
                    margin: EdgeInsets.only(right: 30.h),
                    child: CustomImageView(
                        svgPath: ImageConstant.imgProfileiconsWhiteA70020x20)),
                buttonStyle: CustomButtonStyles.fillPrimaryTL8,
                buttonTextStyle: CustomTextStyles.titleMediumLatoWhite,
                onTap: () {
                  onTapContinuewith2();
                },
              ),
              SizedBox(height: 24.v),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 2.v, right: 10),
                      child: Text("msg_already_have_an".tr,
                          style: CustomTextStyles.bodyLargeLatoBlack),
                    ),
                    TextButton(
                      onPressed: () {
                        onTapSignin();
                      },
                      child: Text(
                        ' Sign In',
                        style: TextStyle(
                            color: appTheme.lightBlueA700, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 64.v),
              Divider(),
              Container(
                width: 327.h,
                margin: EdgeInsets.fromLTRB(10.h, 24.v, 22.h, 5.v),
                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "msg_by_continuing2".tr,
                            style: CustomTextStyles.bodyLargeBlack),
                        TextSpan(
                            text: "msg_terms_of_service".tr,
                            style: CustomTextStyles.bodyLargeBlack),
                        TextSpan(
                            text: "msg_we_will_manage_information".tr,
                            style: CustomTextStyles.bodyLargeBlack),
                        TextSpan(
                            text: "lbl_privacy_policy2".tr,
                            style: CustomTextStyles.bodyLargeBlack),
                        TextSpan(
                            text: "lbl_and".tr,
                            style: CustomTextStyles.bodyLargeBlack),
                        TextSpan(
                            text: "lbl_cookie_policy".tr,
                            style: CustomTextStyles.bodyLargeBlack)
                      ],
                    ),
                    textAlign: TextAlign.left),
              ),
            ],
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

  /// Navigates to the signupOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signupOneScreen.
  onTapContinueWithEmail() {
    Get.toNamed(AppRoutes.signupOneScreen);
  }

  /// Performs a Google sign-in and returns a [GoogleUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Google sign-in process fails.
  onTapContinuewith1() async {
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
  onTapContinuewith2() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// Navigates to the signinScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the signinScreen.
  onTapSignin() {
    Get.toNamed(
      AppRoutes.signinScreen,
    );
  }
}
