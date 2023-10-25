import 'controller/forgot_password_controller.dart';
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
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  ForgotPasswordScreen({Key? key}) : super(key: key);

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
                    text: "lbl_hello_again".tr,
                    margin:
                        EdgeInsets.only(left: 36.h, top: 43.v, bottom: 16.v)),
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
                        EdgeInsets.only(left: 15.h, top: 89.v, right: 15.h),
                    child: Column(children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgForgotpassword,
                          height: 200.v,
                          width: 223.h),
                      Container(
                          width: 325.h,
                          margin: EdgeInsets.only(
                              left: 17.h, top: 42.v, right: 17.h),
                          child: Text("msg_enter_your_email2".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(height: 1.50))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 12.h, top: 31.v, right: 12.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_email_address".tr,
                                    style: CustomTextStyles.titleMediumLato),
                                SizedBox(height: 5.v),
                                CustomTextFormField(
                                    controller: controller.emailController,
                                    hintText: "msg_enter_your_email".tr,
                                    textInputAction: TextInputAction.done,
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
                      SizedBox(height: 80.v),
                      CustomElevatedButton(
                          height: 42.v,
                          text: "lbl_send".tr,
                          buttonStyle: CustomButtonStyles.fillLightBlueA,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumRobotoWhiteA700),
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
}
