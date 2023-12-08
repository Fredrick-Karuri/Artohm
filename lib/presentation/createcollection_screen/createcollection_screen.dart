import 'package:artohmapp/widgets/custom_snackbar.dart';

import '../createcollection_screen/widgets/selectartwork_item_widget.dart';
import 'controller/createcollection_controller.dart';
import 'models/selectartwork_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_iconbutton.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_switch.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CreatecollectionScreen extends GetWidget<CreatecollectionController> {
  const CreatecollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leadingWidth: 46.h,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 40,
            icon:
                Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: bodyContent(),
        bottomNavigationBar: ctaButton(context),
      ),
    );
  }

  bodyContent() {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.h, bottom: 5.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    collectionName(),
                    SizedBox(height: 24.v),
                    collectionDescription(),
                    visibility(),
                    selectArtwork(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ctaButton(BuildContext context) {
    return CustomElevatedButton(
      text: "msg_create_collection".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.v, top: 8),
      buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700Medium,
      onTap: () {
        onTapCreate(context);
      },
    );
  }

  selectArtwork() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 4.h, top: 24.v),
            child: Text("lbl_select_artwork".tr,
                style: theme.textTheme.titleMedium)),
        SizedBox(height: 9.v),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 240.v,
            child: Obx(
              () => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 13.h);
                },
                itemCount: controller.createcollectionModelObj.value
                    .selectartworkItemList.value.length,
                itemBuilder: (context, index) {
                  SelectartworkItemModel model = controller
                      .createcollectionModelObj
                      .value
                      .selectartworkItemList
                      .value[index];
                  return SelectartworkItemWidget(model);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  visibility() {
    return Container(
      margin: EdgeInsets.only(top: 24.v, right: 16.h),
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
                child: Text("msg_private_collection".tr,
                    style: theme.textTheme.bodyMedium)),
            Obx(() => CustomSwitch(
                value: controller.isSelectedSwitch.value,
                onChange: (value) {
                  controller.isSelectedSwitch.value = value;
                }))
          ]),
          SizedBox(height: 16.v),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 3.v),
                child: Text("msg_public_collection".tr,
                    style: theme.textTheme.bodyMedium)),
            Obx(() => CustomSwitch(
                value: controller.isSelectedSwitch1.value,
                onChange: (value) {
                  controller.isSelectedSwitch1.value = value;
                }))
          ]),
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

  collectionDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_collection_description".tr,
            style: theme.textTheme.bodyMedium),
        CustomTextFormField(
            controller: controller.collectionController,
            margin: EdgeInsets.only(top: 9.v, right: 16.h),
            hintText: "msg_embrace_the_world".tr,
            hintStyle: CustomTextStyles.bodyLargeRobotoBlack90001,
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.fillBlueTL4,
            filled: true,
            maxLines: 6,
            fillColor: appTheme.blue50),
      ],
    );
  }

  collectionName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_collection_name".tr, style: theme.textTheme.bodyMedium),
        CustomTextFormField(
            controller: controller.nameController,
            margin: EdgeInsets.only(top: 9.v, right: 16.h),
            hintText: "msg_abstract_masterpieces".tr,
            hintStyle: CustomTextStyles.bodyLargeRobotoBlack90001,
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.fillBlueTL4,
            filled: true,
            fillColor: appTheme.blue50),
            
      ],
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the userProfileContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the userProfileContainerScreen.

  void onTapCreate(BuildContext context) {
    CustomSnackBar.show(
      context,
      'Collection created!',
      Icons.check_circle,
      'OK',
      AppRoutes.userProfileContainerScreen,
    );
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.toNamed(AppRoutes.userProfileContainerScreen);
      },
    );
  }
}
