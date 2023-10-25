import 'controller/upload_artwork_two_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_icon_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class UploadArtworkTwoScreen extends GetWidget<UploadArtworkTwoController> {
  const UploadArtworkTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.h, right: 8.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgMask,
                                        height: 10.v,
                                        width: 49.h,
                                        alignment: Alignment.centerRight),
                                    SizedBox(height: 21.v),
                                    Row(children: [
                                      CustomIconButton(
                                          height: 28.adaptSize,
                                          width: 28.adaptSize,
                                          padding: EdgeInsets.all(7.h),
                                          onTap: () {
                                            onTapBtnArrowleftone();
                                          },
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgArrowleft)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 36.h,
                                              top: 5.v,
                                              bottom: 2.v),
                                          child: Text("msg_uploaded_artwork".tr,
                                              style: CustomTextStyles
                                                  .titleMediumBlack90001_1))
                                    ])
                                  ]),
                              SizedBox(height: 46.v),
                              CustomImageView(
                                  imagePath: ImageConstant.imgRectangle15,
                                  height: 325.v,
                                  width: 358.h,
                                  radius: BorderRadius.circular(8.h)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 38.v, right: 34.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("lbl_title".tr,
                                            style: CustomTextStyles
                                                .titleMediumLato),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.v),
                                            child: Text(
                                                "msg_sunset_over_the".tr,
                                                style:
                                                    theme.textTheme.bodyMedium))
                                      ])),
                              SizedBox(height: 19.v),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_medium".tr,
                                        style:
                                            CustomTextStyles.titleMediumLato),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2.v),
                                        child: Text("lbl_oil_on_canvas".tr,
                                            style: theme.textTheme.bodyMedium))
                                  ]),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.v, right: 96.h),
                                  child: Row(children: [
                                    Text("lbl_dimensions".tr,
                                        style:
                                            CustomTextStyles.titleMediumLato),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 95.h, bottom: 2.v),
                                        child: Text("lbl_24_x_36_inches".tr,
                                            style: theme.textTheme.bodyMedium))
                                  ])),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.v, right: 12.h),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 1.v, bottom: 41.v),
                                            child: Text("lbl_description".tr,
                                                style: CustomTextStyles
                                                    .titleMediumLato)),
                                        Container(
                                            width: 173.h,
                                            margin: EdgeInsets.only(left: 96.h),
                                            child: Text(
                                                "msg_a_vibrant_depiction".tr,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.bodyMedium!
                                                    .copyWith(height: 1.50)))
                                      ])),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 33.v, right: 7.h),
                                  padding: EdgeInsets.all(16.h),
                                  decoration: AppDecoration.fillBlue.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder15),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("lbl_visibility".tr,
                                            style: theme.textTheme.bodyMedium),
                                        SizedBox(height: 22.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.v),
                                                  child: Text("lbl_private".tr,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Obx(() => CustomSwitch(
                                                  value: controller
                                                      .isSelectedSwitch.value,
                                                  onChange: (value) {
                                                    controller.isSelectedSwitch
                                                        .value = value;
                                                  }))
                                            ]),
                                        SizedBox(height: 16.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5.v, bottom: 1.v),
                                                  child: Text(
                                                      "msg_visible_to_everyone"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Obx(() => CustomSwitch(
                                                  value: controller
                                                      .isSelectedSwitch1.value,
                                                  onChange: (value) {
                                                    controller.isSelectedSwitch1
                                                        .value = value;
                                                  }))
                                            ]),
                                        SizedBox(height: 16.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 3.v),
                                                  child: Text(
                                                      "msg_visible_to_followers"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Obx(() => CustomSwitch(
                                                  value: controller
                                                      .isSelectedSwitch2.value,
                                                  onChange: (value) {
                                                    controller.isSelectedSwitch2
                                                        .value = value;
                                                  }))
                                            ])
                                      ]))
                            ])))),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: CustomOutlinedButton(
                          text: "lbl_edit_artwork".tr,
                          margin: EdgeInsets.only(right: 12.h))),
                  Expanded(
                      child: CustomElevatedButton(
                          text: "lbl_post_artwork".tr,
                          margin: EdgeInsets.only(left: 12.h),
                          buttonTextStyle:
                              CustomTextStyles.titleSmallRobotoWhiteA700))
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapBtnArrowleftone() {
    Get.back();
  }
}
