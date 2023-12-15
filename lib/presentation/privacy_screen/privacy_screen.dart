import '../../widgets/custom_appbar_component.dart';
import '../privacy_screen/widgets/row2_item_widget.dart';
import '../privacy_screen/widgets/row_item_widget.dart';
import 'controller/privacy_controller.dart';
import 'models/row2_item_model.dart';
import 'models/row_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends GetWidget<PrivacyController> {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "Privacy Settings".tr,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 36.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("msg_account_visibility".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 11.v),
              Text("msg_choose_who_can_view".tr,
                  style: CustomTextStyles.bodyMediumBlack90001_4),
              Container(
                  margin: EdgeInsets.only(top: 16.v, right: 1.h),
                  padding: EdgeInsets.all(16.h),
                  decoration: AppDecoration.fillSecondaryContainer
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 4.v, bottom: 1.v),
                              child: Text("lbl_everyone".tr,
                                  style: CustomTextStyles
                                      .bodyMediumLibreBaskerville)),
                          Obx(() => CustomSwitch(
                              value: controller.isSelectedSwitch.value,
                              onChange: (value) {
                                controller.isSelectedSwitch.value = value;
                              }))
                        ]),
                    SizedBox(height: 20.v),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 4.v, bottom: 1.v),
                              child: Text("lbl_followers_only".tr,
                                  style: CustomTextStyles
                                      .bodyMediumLibreBaskerville)),
                          Obx(() => CustomSwitch(
                              value: controller.isSelectedSwitch1.value,
                              onChange: (value) {
                                controller.isSelectedSwitch1.value = value;
                              }))
                        ]),
                    SizedBox(height: 20.v),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                              child: Text("lbl_private".tr,
                                  style: CustomTextStyles
                                      .bodyMediumLibreBaskerville)),
                          Obx(() => CustomSwitch(
                              value: controller.isSelectedSwitch2.value,
                              onChange: (value) {
                                controller.isSelectedSwitch2.value = value;
                              }))
                        ])
                  ])),
              SizedBox(height: 26.v),
              Text("msg_artwork_visibility".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 11.v),
              Text("msg_choose_who_can_see".tr,
                  style: CustomTextStyles.bodyMediumBlack90001_4),
              SizedBox(height: 16.v),
              Obx(() => Wrap(
                  runSpacing: 106.v,
                  spacing: 106.h,
                  children: List<Widget>.generate(
                      controller.privacyModelObj.value.rowItemList.value.length,
                      (index) {
                    RowItemModel model = controller
                        .privacyModelObj.value.rowItemList.value[index];
                    return RowItemWidget(model);
                  }))),
              SizedBox(height: 26.v),
              Text("msg_comment_visibility".tr,
                  style: theme.textTheme.titleMedium),
              SizedBox(height: 11.v),
              Text("msg_choose_who_can_comment".tr,
                  style: CustomTextStyles.bodyMediumBlack90001_4),
              SizedBox(height: 16.v),
              Obx(
                () => Wrap(
                  runSpacing: 106.v,
                  spacing: 106.h,
                  children: List<Widget>.generate(
                    controller.privacyModelObj.value.row2ItemList.value.length,
                    (index) {
                      Row2ItemModel model = controller
                          .privacyModelObj.value.row2ItemList.value[index];
                      return Row2ItemWidget(model);
                    },
                  ),
                ),
              ),
              SizedBox(height: 5.v),
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
}
