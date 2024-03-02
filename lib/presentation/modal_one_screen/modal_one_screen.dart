import 'controller/modal_one_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ModalOneScreen extends GetWidget<ModalOneController> {
  const ModalOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.deepOrange50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 21.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 5.v, bottom: 6.v),
                        child: Text("msg_abstract_wonders".tr,
                            style: theme.textTheme.titleMedium)),
                    CustomOutlinedButton(
                        width: 75.h,
                        text: "lbl_public".tr,
                        buttonStyle: CustomButtonStyles.outlineLightBlueATL8,
                        buttonTextStyle:
                            CustomTextStyles.bodyLargeLatoBlue)
                  ]),
              SizedBox(height: 18.v),
              Text("lbl_12_artworks".tr,
                  style: CustomTextStyles.titleMediumLato),
              SizedBox(height: 9.v),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle112,
                    height: 75.v,
                    width: 60.h,
                    radius: BorderRadius.circular(8.h)),
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle1175x60,
                    height: 75.v,
                    width: 60.h,
                    radius: BorderRadius.circular(8.h)),
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle112,
                    height: 75.v,
                    width: 60.h,
                    radius: BorderRadius.circular(8.h)),
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle112,
                    height: 75.v,
                    width: 60.h,
                    radius: BorderRadius.circular(8.h)),
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle112,
                    height: 75.v,
                    width: 60.h,
                    radius: BorderRadius.circular(8.h)),
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle1175x18,
                    height: 75.v,
                    width: 18.h,
                    radius: BorderRadius.circular(8.h))
              ]),
              SizedBox(height: 19.v),
              Text("msg_collection_description".tr,
                  style: CustomTextStyles.titleMediumLato),
              Container(
                  width: 349.h,
                  margin: EdgeInsets.only(top: 10.v, right: 8.h),
                  child: Text("msg_embrace_the_world".tr,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeBlack
                          .copyWith(height: 1.50)))
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 24.v),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: CustomOutlinedButton(
                      text: "lbl_edit_collection".tr,
                      margin: EdgeInsets.only(right: 12.h),
                      onTap: () {
                        onTapEditcollection();
                      })),
              Expanded(
                  child: CustomElevatedButton(
                      text: "msg_delete_collection".tr,
                      margin: EdgeInsets.only(left: 12.h),
                      buttonTextStyle:
                          CustomTextStyles.titleSmallRobotoWhiteA700))
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the createcollectionScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the createcollectionScreen.
  onTapEditcollection() {
    Get.toNamed(
      AppRoutes.createcollectionScreen,
    );
  }
}
