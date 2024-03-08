import '../../widgets/custom_appbar_component.dart';
import 'controller/upload_artwork_two_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
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
        appBar: CustomAppBarComponent(
          title: "msg_uploaded_artwork".tr,
          onBackPressed: () {
            Get.back();
          },
        ),
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
                  buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
                    onTap: () {
                      postArtWork(context);
                    },
                    text: "lbl_post_artwork".tr,
                    margin: EdgeInsets.only(left: 12.h),
                    buttonTextStyle:
                        CustomTextStyles.buttonTextSmall),
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
          padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.v),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle15,
                radius: BorderRadius.circular(8.h),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
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
      margin: EdgeInsets.only(
        top: 24.v,
      ),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillSecondaryOpacity
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("lbl_visibility".tr, style: theme.textTheme.bodyMedium),
          SizedBox(height: 22.v),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.v),
                      child: Text("lbl_private".tr,
                          style: theme.textTheme.bodyMedium)),
                  Obx(
                    () => CustomSwitch(
                      value: controller.isSelectedSwitch(0),
                      onChange: (value) {
                        if (value) {
                          controller.updateSelectedSwitch(0);
                        }
                      },
                    ),
                  ),
                ],
              ),
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
                      value: controller.isSelectedSwitch(1),
                      onChange: (value) {
                        if (value) {
                          controller.updateSelectedSwitch(1);
                        }
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
                      value: controller.isSelectedSwitch(2),
                      onChange: (value) {
                        if (value) {
                          controller.updateSelectedSwitch(2);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void postArtWork(BuildContext context) {
    try {
      // code ti post artwork if the artwork is valid/ post is successful
      Get.snackbar(
        'Success',
        'Artwork Created!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.offAllNamed(AppRoutes.userProfileContainerScreen);
        },
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Artwork not created! : $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
  // CustomSnackBar.show(
  //   context,
  //   'Artwork Created!',
  //   Icons.check_circle,
  //   'OK',
  // );

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
