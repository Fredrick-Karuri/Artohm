import '../../widgets/custom_appbar_component.dart';
import 'controller/settingsitem_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class SettingsitemScreen extends GetWidget<SettingsitemController> {
  const SettingsitemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBarComponent(title: "msg_notification_settings".tr),
            // appBar: CustomAppBar(
            //     leadingWidth: 46.h,
            //     leading: AppbarImage(
            //         svgPath: ImageConstant.imgArrowleftRed300,
            //         margin:
            //             EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
            //         onTap: () {
            //           onTapArrowleftone();
            //         }),
            //     title: AppbarTitle(
            //         text: "msg_notification_settings".tr,
            //         margin:
            //             EdgeInsets.only(left: 36.h, top: 41.v, bottom: 15.v)),
            //     actions: [
            //       AppbarImage1(
            //         svgPath: ImageConstant.imgMask,
            //         margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v),
            //       )
            //     ],
            //     styleType: Style.bgOutline),
            body: Container(
                width: 359.h,
                margin: EdgeInsets.fromLTRB(15.h, 34.v, 15.h, 5.v),
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
                decoration: AppDecoration.outlineBlack900011
                    .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                                child: Text("msg_push_notifications".tr,
                                    style: theme.textTheme.titleSmall)),
                            Obx(() => CustomSwitch(
                                value: controller.isSelectedSwitch.value,
                                onChange: (value) {
                                  controller.isSelectedSwitch.value = value;
                                }))
                          ])),
                  Container(
                      width: 325.h,
                      margin: EdgeInsets.only(left: 8.h, top: 10.v, right: 9.h),
                      child: Text("msg_receive_updates".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumBlack90001_4
                              .copyWith(height: 1.50))),
                  Padding(
                      padding: EdgeInsets.only(left: 8.h, top: 37.v),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                                child: Text("msg_email_notifications".tr,
                                    style: theme.textTheme.titleSmall)),
                            Obx(() => CustomSwitch(
                                value: controller.isSelectedSwitch2.value,
                                onChange: (value) {
                                  controller.isSelectedSwitch2.value = value;
                                }))
                          ])),
                  SizedBox(height: 11.v),
                  Text("msg_stay_informed_about".tr,
                      style: CustomTextStyles.bodyMediumBlack90001_4)
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
