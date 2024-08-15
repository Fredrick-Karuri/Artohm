import 'package:artohmapp/presentation/artworks/widgets/tools(mediums).dart';
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
  final GlobalKey<FormState> _formKey;

  UploadArtworkScreen({Key? key, required GlobalKey<FormState> formKey})
      : _formKey = formKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    iconSize: 40,
                    icon: Icon(
                      Icons.close,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: _children[index],
                      );
                    },
                    childCount: _children.length,
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: SafeArea(
          //     child: IconButton(
          //       onPressed: () {
          //         Get.back();
          //       },
          //       iconSize: 40,
          //       icon: Icon(
          //         Icons.close,
          //         color: theme.colorScheme.tertiary,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: CustomElevatedButton(
        buttonStyle: CustomButtonStyles.fillPrimaryButton,
        height: 36.v,
        text: "lbl_save".tr,
        margin:
            EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v, top: 8.v),
        buttonTextStyle: CustomTextStyles.buttonText,
        onTap: () async {
          if (_formKey.currentState!.validate()) {
            controller.saveArtworkDetails();

            Get.toNamed(
              AppRoutes.uploadArtworkTwoScreen,
            );
          }
          // onTapSave();
        },
      ),
    );
  }

  List<Widget> get _children => [
        title(),
        description(),
        ArtworkTypeSelection(),
        ArtworkTagSelection(),
        MediumsView(),
        // medium(),
        // Obx(
        //   () => dimensions(),
        // ),
        images(),
        ArtworkSaleForm(),
      ];
  // return SafeArea(
  //   child: Scaffold(
  //     appBar: AppBar(
  //       leadingWidth: 46.h,
  //       backgroundColor: Colors.white,
  //       leading: IconButton(
  //         onPressed: () {
  //           Get.back();
  //         },
  //         iconSize: 40,
  //         icon: Icon(
  //           Icons.close,
  //           color: theme.colorScheme.tertiary,
  //         ),
  //       ),
  //     ),
  //     resizeToAvoidBottomInset: true,
  //     body: bodyContent(),
  //     bottomNavigationBar: CustomElevatedButton(
  //       buttonStyle: CustomButtonStyles.fillPrimaryButton,
  //       height: 36.v,
  //       text: "lbl_save".tr,
  //       margin:
  //           EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v, top: 8.v),
  //       buttonTextStyle: CustomTextStyles.buttonText,
  //       onTap: () async {
  //         if (_formKey.currentState!.validate()) {
  //           controller.saveArtworkDetails();

  //           Get.toNamed(
  //             AppRoutes.uploadArtworkTwoScreen,
  //           );
  //         }
  //         // onTapSave();
  //       },
  //     ),
  //   ),
  // );

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
                buttonTextStyle: CustomTextStyles.buttonTextSmall),
          ),
          Expanded(
            child: CustomOutlinedButton(
              onTap: () {
                controller.takePicture();
              },
              text: "lbl_take_a_photo".tr,
              margin: EdgeInsets.only(left: 12.h),
              buttonTextStyle: CustomTextStyles.buttonTextSmall!
                  .copyWith(color: theme.colorScheme.tertiary),
            ),
          )
        ],
      ),
    );
  }

  dimensions() {
    var inputWidth = ''.obs;
    var inputHeight = ''.obs;
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
              Text("Dimensions", style: CustomTextStyles.titleSmall),
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
                            onChanged: (value) {
                              inputWidth.value = value; // update the value
                            },
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
                            onChanged: (value) {
                              inputHeight.value = value; // update the value
                            },
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          SizedBox(height: 16.v),
                          Obx(() {
                            // Wrap the Chip widget with Obx to listen for changes
                            return Chip(
                              side: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 8.v),
                              label: Text(
                                  "${inputWidth.value} x ${inputHeight.value}",
                                  style: theme.textTheme.bodyMedium),
                              backgroundColor: Colors.transparent,
                              labelStyle:
                                  theme.textTheme.bodyMedium!.copyWith(),
                              visualDensity: VisualDensity.compact,
                            );
                          }),
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
          padding: EdgeInsets.only(left: 7.h, top: 32.v),
          child: Text("lbl_description".tr, style: CustomTextStyles.titleSmall),
        ),
        CustomTextFormField(
          controller: controller.inputDescriptionController,
          focusNode: controller.inputDescriptionFocusNode,
          margin: EdgeInsets.only(left: 7.h, top: 8.v, right: 7.h),
          hintText: "Tell us a bit about your artwork".tr,
          // hintStyle: CustomTextStyles.bodyLarge,
          textInputAction: TextInputAction.done,
          borderDecoration: TextFormFieldStyleHelper.fillSecondaryOpacityTL4,
          filled: true,
          fillColor: theme.colorScheme.secondary.withOpacity(.08),
          maxLines: 3,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a description';
            }
            return null;
          },
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
          child: Text(
            "lbl_title".tr,
            style: CustomTextStyles.titleSmall,
          ),
        ),
        CustomTextFormField(
          controller: controller.inputTitleController,
          focusNode: controller.inputTitleFocusNode,
          margin: EdgeInsets.only(left: 7.h, top: 9.v, right: 7.h),
          hintText: "Title of the artwork".tr,
          borderDecoration: TextFormFieldStyleHelper.fillSecondaryOpacity,
          filled: true,
          fillColor: theme.colorScheme.secondary.withOpacity(.08),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a title';
            }
            return null;
          },
        ),
      ],
    );
  }

  /// Navigates to the uploadArtworkTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the uploadArtworkTwoScreen.
  // onTapSave() {
  //   if (_formKey.currentState != null && _formKey.currentState!.validate()) {
  //     controller.saveArtworkDetails();

  //     Get.toNamed(
  //       AppRoutes.uploadArtworkTwoScreen,
  //     );
  //   }
  // }
}

                                        // CustomOutlinedButton(
                                        //     height: 29.v,
                                        //     width: 49.h,
                                        //     text: "lbl_36".tr,
                                        //     buttonStyle: CustomButtonStyles
                                        //         .outlineBlackTL83,
                                        //     buttonTextStyle:
                                        //         theme.textTheme.bodyMedium!)