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
        appBar: CustomAppBar(
            height: 59.v,
            leadingWidth: 46.h,
            leading: AppbarIconbutton(
                svgPath: ImageConstant.imgArrowleft,
                margin: EdgeInsets.only(left: 18.h, top: 31.v),
                onTap: () {
                  onTapArrowleftone();
                }),
            title: AppbarSubtitle(
                text: "lbl_collections".tr,
                margin: EdgeInsets.only(left: 36.h, top: 34.v, bottom: 4.v)),
            actions: [
              AppbarImage1(
                  svgPath: ImageConstant.imgMask,
                  margin: EdgeInsets.only(left: 9.h, right: 9.h, bottom: 49.v))
            ]),
        body: bodyContent(),
      ),
    );
  }

  bodyContent() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 7.v),
      child: Column(
        children: [
          SizedBox(height: 32.v),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.h, bottom: 5.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    collectionName(),
                    SizedBox(height: 27.v),
                    collectionDescription(),
                    visibility(),
                    selectArtwork(),
                    SizedBox(height: 24.v),
                    ctaButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ctaButton() {
    return CustomElevatedButton(
      text: "msg_create_collection".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 32.v),
      buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700Medium,
      onTap: () {
        onTapCreate();
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
        Container(
          width: 358.h,
          margin: EdgeInsets.only(top: 8.v, right: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
          decoration: AppDecoration.fillBlue
              .copyWith(borderRadius: BorderRadiusStyle.customBorderTL4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 320.h,
                  margin: EdgeInsets.only(top: 1.v, right: 5.h),
                  child: Text("msg_embrace_the_world".tr,
                      maxLines: 11,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeRobotoBlack90001
                          .copyWith(height: 1.50))),
              SizedBox(height: 3.v),
              // SizedBox(
              //   height: 17.v,
              //   child: VerticalDivider(
              //       width: 1.h,
              //       thickness: 1.v,
              //       color: appTheme.red300),
              // )
            ],
          ),
        ),
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
  onTapCreate() {
    Get.toNamed(
      AppRoutes.userProfileContainerScreen,
    );
  }
}
