import '../../widgets/custom_appbar_component.dart';
import '../../widgets/custom_snackbar.dart';
import 'controller/upload_artwork_two_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_icon_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

import 'widgets/custom_row.dart';

class UploadArtworkTwoScreen extends GetWidget<UploadArtworkTwoController> {
  const UploadArtworkTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(title: "msg_uploaded_artwork".tr),
        body: bodyContent(),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v, top: 8.v),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomOutlinedButton(
                  onTap: () {
                    onTapEditArtwork();
                  },
                  text: "lbl_edit_artwork".tr,
                  margin: EdgeInsets.only(right: 12.h),
                ),
              ),
              Expanded(
                child: CustomElevatedButton(
                    onTap: () {
                      postArtWork(context);
                    },
                    text: "lbl_post_artwork".tr,
                    margin: EdgeInsets.only(left: 12.h),
                    buttonTextStyle:
                        CustomTextStyles.titleSmallRobotoWhiteA700),
              )
            ],
          ),
        ),
      ),
    );
  }

  bodyContent() {
    return SizedBox(
      width: mediaQueryData.size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.h, right: 8.h, bottom: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle15,
                height: 325.v,
                width: 358.h,
                radius: BorderRadius.circular(8.h),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 16),
                child: Column(
                  children: [
                    CustomRowWidget(
                      title: "lbl_title".tr,
                      text: "msg_sunset_over_the".tr,
                    ),
                    CustomRowWidget(
                      title: "lbl_medium".tr,
                      text: "lbl_oil_on_canvas".tr,
                    ),
                    CustomRowWidget(
                      title: "lbl_dimensions".tr,
                      text: "lbl_24_x_36_inches".tr,
                    ),
                    CustomRowWidget(
                      title: "lbl_description".tr,
                      text: "msg_a_vibrant_depiction".tr,
                    ),
                  ],
                ),
              ),
              switchCard(),
            ],
          ),
        ),
      ),
    );
  }

  switchCard() {
    return Container(
      margin: EdgeInsets.only(top: 33.v, right: 7.h),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillBlue
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("lbl_visibility".tr, style: theme.textTheme.bodyMedium),
          SizedBox(height: 22.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 3.v),
                child:
                    Text("lbl_private".tr, style: theme.textTheme.bodyMedium)),
            Obx(() => CustomSwitch(
                value: controller.isSelectedSwitch.value,
                onChange: (value) {
                  controller.isSelectedSwitch.value = value;
                }))
          ]),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 5.v, bottom: 1.v),
                  child: Text("msg_visible_to_everyone".tr,
                      style: theme.textTheme.bodyMedium)),
              Obx(
                () => CustomSwitch(
                  value: controller.isSelectedSwitch1.value,
                  onChange: (value) {
                    controller.isSelectedSwitch1.value = value;
                  },
                ),
              )
            ],
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.v),
                  child: Text("msg_visible_to_followers".tr,
                      style: theme.textTheme.bodyMedium)),
              Obx(
                () => CustomSwitch(
                  value: controller.isSelectedSwitch2.value,
                  onChange: (value) {
                    controller.isSelectedSwitch2.value = value;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void postArtWork(BuildContext context) {
    CustomSnackBar.show(
      context,
      'Artwork Created!',
      Icons.check_circle,
      'OK',
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapBtnArrowleftone() {
    Get.back();
  }
}

onTapEditArtwork() {
  Get.toNamed(
    AppRoutes.uploadArtworkScreen,
  );
}
