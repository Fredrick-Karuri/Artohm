import '../../widgets/custom_appbar_component.dart';
import '../collaborateitem_screen/widgets/chipviewcont2_item_widget.dart';
import '../collaborateitem_screen/widgets/chipviewcont_item_widget.dart';
import 'controller/collaborateitem_controller.dart';
import 'models/chipviewcont2_item_model.dart';
import 'models/chipviewcont_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CollaborateitemScreen extends GetWidget<CollaborateitemController> {
  const CollaborateitemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            // appBar: CustomAppBarComponent(title: "lbl_collaborate".tr),

            appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  60.0), // change this size as per your requirement
              child: AppBar(
                backgroundColor: Colors.white,
                leadingWidth: MediaQuery.of(context)
                    .size
                    .width, // this will take the full width
                leading: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      CustomIconButton(
                        height: 28.adaptSize,
                        width: 28.adaptSize,
                        padding: EdgeInsets.all(7.h),
                        onTap: () {
                          onTapBtnArrowleftone();
                        },
                        child:
                            CustomImageView(svgPath: ImageConstant.imgArrowleft),
                      ),
                      // Expanded(
                      //   child: Padding(
                      //     padding: EdgeInsets.only(left: 32.h),
                      //     child: Text("lbl_collaborate".tr,
                      //         style: CustomTextStyles.titleMediumBlack90001),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      margin:
                          EdgeInsets.only(left: 18.h, top: 7.v, right: 14.h),
                      padding: EdgeInsets.all(8.h),
                      decoration: AppDecoration.outlineGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle11,
                                height: 180.v,
                                width: 342.h,
                                radius: BorderRadius.circular(8.h)),
                            Padding(
                                padding: EdgeInsets.only(left: 10.h, top: 12.v),
                                child: Text("msg_harmony_of_nature".tr,
                                    style: theme.textTheme.titleSmall)),
                            Padding(
                                padding: EdgeInsets.only(left: 10.h, top: 7.v),
                                child: Row(children: [
                                  SizedBox(
                                      height: 30.v,
                                      width: 45.h,
                                      child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgEllipse130x30,
                                                height: 30.adaptSize,
                                                width: 30.adaptSize,
                                                radius:
                                                    BorderRadius.circular(15.h),
                                                alignment:
                                                    Alignment.centerLeft),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgEllipse11,
                                                height: 30.adaptSize,
                                                width: 30.adaptSize,
                                                radius:
                                                    BorderRadius.circular(15.h),
                                                alignment:
                                                    Alignment.centerRight)
                                          ])),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 12.h, top: 7.v, bottom: 5.v),
                                      child: Text("msg_sarah_smith_david2".tr,
                                          style: theme.textTheme.bodyMedium))
                                ])),
                            Padding(
                                padding: EdgeInsets.only(left: 10.h, top: 9.v),
                                child: Text("msg_july_8_august".tr,
                                    style: CustomTextStyles.bodyMediumLight)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 322.h,
                                    margin: EdgeInsets.fromLTRB(
                                        10.h, 8.v, 10.h, 5.v),
                                    child: Text("msg_sarah_s_intricate".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyMediumBlack90001
                                            .copyWith(height: 1.50))))
                          ])),
                  Container(
                      margin:
                          EdgeInsets.only(left: 18.h, top: 46.v, right: 14.h),
                      decoration: AppDecoration.fillWhiteA,
                      child: Column(children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.h, vertical: 8.v),
                            decoration: AppDecoration.fillPrimary.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 2.v),
                                  Text("msg_collaboration_agenda".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 9.v),
                                  SizedBox(
                                      width: 324.h,
                                      child: Text("msg_blending_digital".tr,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyLargeBlack90001
                                              .copyWith(height: 1.50))),
                                  SizedBox(height: 15.v),
                                  Obx(() => Wrap(
                                      runSpacing: 8.v,
                                      spacing: 8.h,
                                      children: List<Widget>.generate(
                                          controller
                                              .collaborateitemModelObj
                                              .value
                                              .chipviewcontItemList
                                              .value
                                              .length, (index) {
                                        ChipviewcontItemModel model = controller
                                            .collaborateitemModelObj
                                            .value
                                            .chipviewcontItemList
                                            .value[index];
                                        return ChipviewcontItemWidget(model);
                                      }))),
                                  SizedBox(height: 16.v),
                                  Text("lbl_materials_used".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 9.v),
                                  Obx(() => Wrap(
                                      runSpacing: 8.v,
                                      spacing: 8.h,
                                      children: List<Widget>.generate(
                                          controller
                                              .collaborateitemModelObj
                                              .value
                                              .chipviewcont2ItemList
                                              .value
                                              .length, (index) {
                                        Chipviewcont2ItemModel model =
                                            controller
                                                .collaborateitemModelObj
                                                .value
                                                .chipviewcont2ItemList
                                                .value[index];
                                        return Chipviewcont2ItemWidget(model);
                                      }))),
                                  SizedBox(height: 16.v),
                                  Text("lbl_artwork_outcome".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 13.v),
                                  Text("msg_a_digital_artistic".tr,
                                      style: CustomTextStyles
                                          .bodyMediumBlack90001_4)
                                ])),
                        SizedBox(height: 16.v),
                        CustomElevatedButton(
                            height: 35.v, text: "msg_join_collaboration".tr)
                      ])),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 18.h, top: 48.v),
                          child: Text("msg_participating_artists".tr,
                              style: theme.textTheme.titleMedium))),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding:
                          EdgeInsets.only(left: 18.h, top: 15.v, bottom: 31.v),
                      child: IntrinsicWidth(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Column(children: [
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgEllipse180x80,
                                        height: 80.adaptSize,
                                        width: 80.adaptSize,
                                        radius: BorderRadius.circular(40.h)),
                                    SizedBox(height: 8.v),
                                    Text("lbl_sarah_smith".tr,
                                        style: theme.textTheme.titleSmall),
                                    SizedBox(height: 11.v),
                                    SizedBox(
                                        width: 157.h,
                                        child: Text("msg_a_digital_artist".tr,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodySmallLatoBlack90001
                                                .copyWith(height: 1.50)))
                                  ]),
                                  Padding(
                                      padding: EdgeInsets.only(left: 18.h),
                                      child: Column(children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgEllipse180x80,
                                            height: 80.adaptSize,
                                            width: 80.adaptSize,
                                            radius:
                                                BorderRadius.circular(40.h)),
                                        SizedBox(height: 8.v),
                                        Text("lbl_sarah_smith".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        SizedBox(
                                            width: 157.h,
                                            child: Text(
                                                "msg_a_digital_artist".tr,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .bodySmallLatoBlack90001
                                                    .copyWith(height: 1.50)))
                                      ]))
                                ])),
                            Padding(
                                padding: EdgeInsets.only(left: 18.h),
                                child: Column(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgEllipse180x80,
                                      height: 80.adaptSize,
                                      width: 80.adaptSize,
                                      radius: BorderRadius.circular(40.h)),
                                  SizedBox(height: 8.v),
                                  Text("lbl_sarah_smith".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 10.v),
                                  SizedBox(
                                      width: 160.h,
                                      child: Text("msg_a_digital_artist".tr,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodySmallLatoBlack90001
                                              .copyWith(height: 1.50)))
                                ]))
                          ])))
                ])))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapBtnArrowleftone() {
    Get.back();
  }
}
