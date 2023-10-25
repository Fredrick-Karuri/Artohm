import 'controller/upload_artwork_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class UploadArtworkScreen extends GetWidget<UploadArtworkController> {
  const UploadArtworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 7.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgMask,
                                    height: 10.v,
                                    width: 49.h,
                                    alignment: Alignment.centerRight),
                                SizedBox(height: 21.v),
                                CustomImageView(
                                    svgPath: ImageConstant.imgNavtoRed300,
                                    height: 28.adaptSize,
                                    width: 28.adaptSize)
                              ])),
                      Padding(
                          padding: EdgeInsets.only(left: 7.h, top: 46.v),
                          child: Text("lbl_title".tr,
                              style: theme.textTheme.titleSmall)),
                      CustomTextFormField(
                          controller: controller.inputTextController,
                          margin:
                              EdgeInsets.only(left: 7.h, top: 9.v, right: 7.h),
                          hintText: "lbl_input_text".tr,
                          hintStyle: CustomTextStyles.bodyLargeRobotoBlack90001,
                          borderDecoration: TextFormFieldStyleHelper.fillBlue,
                          filled: true,
                          fillColor: appTheme.blue50),
                      Padding(
                          padding: EdgeInsets.only(left: 7.h, top: 37.v),
                          child: Text("lbl_description".tr,
                              style: theme.textTheme.titleSmall)),
                      CustomTextFormField(
                          controller: controller.inputtextoneController,
                          margin:
                              EdgeInsets.only(left: 7.h, top: 8.v, right: 7.h),
                          hintText: "lbl_input_text".tr,
                          hintStyle: CustomTextStyles.bodyLargeRobotoBlack90001,
                          textInputAction: TextInputAction.done,
                          borderDecoration:
                              TextFormFieldStyleHelper.fillBlueTL4,
                          filled: true,
                          fillColor: appTheme.blue50),
                      Container(
                          margin:
                              EdgeInsets.only(left: 7.h, top: 36.v, right: 7.h),
                          padding: EdgeInsets.all(16.h),
                          decoration: AppDecoration.fillPink5001.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder15),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_dimensions".tr,
                                    style: theme.textTheme.titleSmall),
                                SizedBox(height: 17.v),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomDropDown(
                                          width: 92.h,
                                          icon: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  8.h, 12.v, 16.h, 9.v),
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgProfileiconsRed30012x18)),
                                          margin: EdgeInsets.only(bottom: 41.v),
                                          hintText: "lbl_inches".tr,
                                          items: controller
                                              .uploadArtworkModelObj
                                              .value
                                              .dropdownItemList!
                                              .value,
                                          onChanged: (value) {
                                            controller.onSelected(value);
                                          }),
                                      Column(children: [
                                        Text("lbl_width".tr,
                                            style: theme.textTheme.bodyMedium),
                                        SizedBox(height: 23.v),
                                        CustomOutlinedButton(
                                            height: 29.v,
                                            width: 49.h,
                                            text: "lbl_24".tr,
                                            buttonStyle: CustomButtonStyles
                                                .outlineBlackTL83,
                                            buttonTextStyle:
                                                theme.textTheme.bodyMedium!)
                                      ]),
                                      Column(children: [
                                        Text("lbl_height".tr,
                                            style: theme.textTheme.bodyMedium),
                                        SizedBox(height: 22.v),
                                        CustomOutlinedButton(
                                            height: 29.v,
                                            width: 49.h,
                                            text: "lbl_36".tr,
                                            buttonStyle: CustomButtonStyles
                                                .outlineBlackTL83,
                                            buttonTextStyle:
                                                theme.textTheme.bodyMedium!)
                                      ])
                                    ]),
                                SizedBox(height: 13.v),
                                CustomElevatedButton(
                                    width: 101.h,
                                    text: "lbl_24_x_36_inches".tr,
                                    buttonStyle: CustomButtonStyles.fillWhiteA,
                                    buttonTextStyle: CustomTextStyles
                                        .bodySmallLatoBlack9000112)
                              ])),
                      Container(
                          width: 358.h,
                          margin:
                              EdgeInsets.only(left: 7.h, top: 36.v, right: 7.h),
                          padding: EdgeInsets.all(16.h),
                          decoration: AppDecoration.fillPink5001.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder15),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("lbl_medium".tr,
                                    style: theme.textTheme.titleSmall),
                                SizedBox(height: 17.v),
                                CustomDropDown(
                                    width: 160.h,
                                    icon: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            24.h, 12.v, 16.h, 13.v),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgProfileiconsRed30012x18)),
                                    hintText: "lbl_oil_on_canvas".tr,
                                    items: controller.uploadArtworkModelObj
                                        .value.dropdownItemList1!.value,
                                    contentPadding: EdgeInsets.only(
                                        left: 16.h, top: 10.v, bottom: 10.v),
                                    onChanged: (value) {
                                      controller.onSelected1(value);
                                    })
                              ])),
                      Padding(
                          padding: EdgeInsets.fromLTRB(7.h, 36.v, 7.h, 5.v),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: CustomElevatedButton(
                                        text: "lbl_choose_image".tr,
                                        margin: EdgeInsets.only(right: 12.h),
                                        buttonTextStyle: CustomTextStyles
                                            .titleSmallLatoWhiteA700Medium_1)),
                                Expanded(
                                    child: CustomOutlinedButton(
                                        text: "lbl_take_a_photo".tr,
                                        margin: EdgeInsets.only(left: 12.h),
                                        buttonTextStyle: CustomTextStyles
                                            .titleSmallLatoRed300Medium))
                              ]))
                    ])),
            bottomNavigationBar: CustomElevatedButton(
                height: 36.v,
                text: "lbl_save".tr,
                margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v),
                buttonTextStyle:
                    CustomTextStyles.titleSmallLatoWhiteA700Medium_1,
                onTap: () {
                  onTapSave();
                })));
  }

  /// Navigates to the uploadArtworkTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the uploadArtworkTwoScreen.
  onTapSave() {
    Get.toNamed(
      AppRoutes.uploadArtworkTwoScreen,
    );
  }
}
