import 'package:artohmapp/presentation/upload_artwork_screen/widgets/artwork_sale_form.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/widgets/artwork_tags.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/widgets/artwork_type.dart';

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
        appBar: AppBar(
          leadingWidth: 46.h,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pop();
              Get.back();
            },
            iconSize: 40,
            icon:
                Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: bodyContent(),
        bottomNavigationBar: CustomElevatedButton(
          buttonStyle: CustomButtonStyles.fillPrimaryButton,
          height: 36.v,
          text: "lbl_save".tr,
          margin:
              EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v, top: 8.v),
          buttonTextStyle: CustomTextStyles.buttonText,
          onTap: () {
            onTapSave();
          },
        ),
      ),
    );
  }

  bodyContent() {
    return SingleChildScrollView(
      // width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(),
          description(),
          ArtworkTypeSelection(),
          ArtworkTagSelection(),
          medium(),
          dimensions(),
          images(),
          ArtworkSaleForm(),
        ],
      ),
    );
  }

  images() {
    return Padding(
      padding: EdgeInsets.fromLTRB(7.h, 36.v, 7.h, 5.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomElevatedButton(
              buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
                onTap: () {
                  controller.pickImage();
                },
                text: "lbl_choose_image".tr,
                margin: EdgeInsets.only(right: 12.h),
                buttonTextStyle:
                    CustomTextStyles.buttonTextSmall),
          ),
          Expanded(
            child: CustomOutlinedButton(
              onTap: () {
                controller.takePicture();
              },
              text: "lbl_take_a_photo".tr,
              margin: EdgeInsets.only(left: 12.h),
              buttonTextStyle: CustomTextStyles.buttonTextSmall!.copyWith(
                color:theme.colorScheme.tertiary
              ),
            ),
          )
        ],
      ),
    );
  }

  medium() {
    return Container(
      margin: EdgeInsets.only(left: 7.h, top: 36.v, right: 7.h),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillPrimaryOpacity2
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Medium",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(width: 8.h),
              Text("(How was your piece made?)",
                  style: theme.textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: 17.v),
          CustomDropDown(
            hintText: "lbl_oil_on_canvas".tr,
            items: controller
                .uploadArtworkModelObj.value.mediumDropdownItemList.value,
            contentPadding:
                EdgeInsets.only(left: 16.h, top: 10.v, bottom: 10.v, right: 16),
            onChanged: (value) {
              controller.onSelectedMedium(value);
            },
          ),
        ],
      ),
    );
  }

  dimensions() {
    return Container(
      margin: EdgeInsets.only(left: 7.h, top: 36.v, right: 7.h),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillPrimaryOpacity2
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Dimensions", style: theme.textTheme.titleSmall),
              SizedBox(width: 8.h),
              Text("(How big is your piece?)",
                  style: theme.textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: 16.v),
          Column(
            children: [
              CustomDropDown(
                hintText: "lbl_inches".tr,
                items: controller.uploadArtworkModelObj.value
                    .dimensionsDropdownItemList.value,
                onChanged: (value) {
                  controller.onSelectedDimensions(value);
                },
              ),
              SizedBox(height: 8.v),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_width".tr,
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 24.v),
                          CustomTextFormField(
                            controller: controller.inputWidthController,
                            focusNode: controller.inputWidthFocusNode,
                            textInputType: TextInputType.number,
                            width: 64.h,
                            hintText: '24',
                            borderDecoration: OutlineInputBorder(),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_height".tr,
                              style: theme.textTheme.bodyMedium),
                          SizedBox(height: 24.v),
                          CustomTextFormField(
                            controller: controller.inputHeightController,
                            focusNode: controller.inputHeightFocusNode,
                            textInputType: TextInputType.number,
                            width: 64.h,
                            hintText: '36',
                            borderDecoration: OutlineInputBorder(),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          SizedBox(height: 16.v),
                          Chip(
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 8.v),
                            label: Text("24 x 36",
                                style: theme.textTheme.bodyMedium),
                            backgroundColor: Colors.transparent,
                            labelStyle: theme.textTheme.bodyMedium!.copyWith(),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ],
          ),
          SizedBox(height: 16.v),
        ],
      ),
    );
  }

  description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 7.h, top: 37.v),
          child: Text("lbl_description".tr, style: theme.textTheme.titleSmall),
        ),
        CustomTextFormField(
          controller: controller.inputDescriptionController,
          focusNode: controller.inputDescriptionFocusNode,
          margin: EdgeInsets.only(left: 7.h, top: 8.v, right: 7.h),
          hintText: "Tell us a bit about your artwork".tr,
          hintStyle: CustomTextStyles.bodyLarge,
          textInputAction: TextInputAction.done,
          borderDecoration: TextFormFieldStyleHelper.fillSecondaryOpacityTL4,
          filled: true,
          fillColor: theme.colorScheme.secondary.withOpacity(.08),
          maxLines: 3,
        ),
      ],
    );
  }

  title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 7.h, top: 16.v),
            child: Text("lbl_title".tr, style: theme.textTheme.titleSmall)),
        CustomTextFormField(
            controller: controller.inputTitleController,
            focusNode: controller.inputTitleFocusNode,
            margin: EdgeInsets.only(left: 7.h, top: 9.v, right: 7.h),
            hintText: "Title of the artwork".tr,
            hintStyle: CustomTextStyles.bodyLarge,
            borderDecoration: TextFormFieldStyleHelper.fillSecondaryOpacity,
            filled: true,
            fillColor: theme.colorScheme.secondary.withOpacity(.08)),
      ],
    );
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

                                        // CustomOutlinedButton(
                                        //     height: 29.v,
                                        //     width: 49.h,
                                        //     text: "lbl_36".tr,
                                        //     buttonStyle: CustomButtonStyles
                                        //         .outlineBlackTL83,
                                        //     buttonTextStyle:
                                        //         theme.textTheme.bodyMedium!)