import '../collaborate_screen/widgets/chipviewselect_item_widget.dart';
import 'controller/collaborate_controller.dart';
import 'models/chipviewselect_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_bottom_bar.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class CollaborateScreen extends GetWidget<CollaborateController> {
  const CollaborateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                leadingWidth: 46.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftRed300,
                    margin:
                        EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
                    onTap: () {
                      onTapArrowleftone();
                    }),
                title: AppbarTitle(
                    text: "lbl_collaborate".tr,
                    margin:
                        EdgeInsets.only(left: 36.h, top: 39.v, bottom: 17.v)),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgMask,
                      margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v))
                ],
                styleType: Style.bgOutline),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 24.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 16.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h, vertical: 13.v),
                                        decoration: AppDecoration.outlineBlack
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 2.v),
                                              Text(
                                                  "msg_featured_art_collaboration"
                                                      .tr,
                                                  style: theme
                                                      .textTheme.titleMedium),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgRectangle11180x316,
                                                  height: 180.v,
                                                  width: 316.h,
                                                  radius: BorderRadius.circular(
                                                      8.h),
                                                  margin: EdgeInsets.only(
                                                      left: 5.h, top: 17.v)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.h, top: 12.v),
                                                  child: Text(
                                                      "msg_harmony_of_nature"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .titleMedium)),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.h, top: 7.v),
                                                  child: Row(children: [
                                                    SizedBox(
                                                        height: 30.v,
                                                        width: 60.h,
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            children: [
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgEllipse1,
                                                                  height: 30
                                                                      .adaptSize,
                                                                  width: 30
                                                                      .adaptSize,
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          15.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft),
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgEllipse130x30,
                                                                  height: 30
                                                                      .adaptSize,
                                                                  width: 30
                                                                      .adaptSize,
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          15.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .center),
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgEllipse11,
                                                                  height: 30
                                                                      .adaptSize,
                                                                  width: 30
                                                                      .adaptSize,
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          15.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight)
                                                            ])),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.h,
                                                                top: 7.v,
                                                                bottom: 5.v),
                                                        child: Text(
                                                            "msg_sarah_smith_david2"
                                                                .tr,
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium))
                                                  ])),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.h, top: 9.v),
                                                  child: Text(
                                                      "msg_july_8_august".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumLight)),
                                              Container(
                                                  width: 295.h,
                                                  margin: EdgeInsets.only(
                                                      left: 10.h,
                                                      top: 8.v,
                                                      right: 20.h),
                                                  child: Text(
                                                      "msg_sarah_s_intricate"
                                                          .tr,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: theme
                                                          .textTheme.bodyMedium!
                                                          .copyWith(
                                                              height: 1.50)))
                                            ])),
                                    SizedBox(height: 57.v),
                                    Obx(() => Wrap(
                                        runSpacing: 8.v,
                                        spacing: 8.h,
                                        children: List<Widget>.generate(
                                            controller
                                                .collaborateModelObj
                                                .value
                                                .chipviewselectItemList
                                                .value
                                                .length, (index) {
                                          ChipviewselectItemModel model =
                                              controller
                                                  .collaborateModelObj
                                                  .value
                                                  .chipviewselectItemList
                                                  .value[index];
                                          return ChipviewselectItemWidget(
                                              model);
                                        }))),
                                    SizedBox(height: 24.v),
                                    Text("lbl_mediums".tr,
                                        style: theme.textTheme.bodyMedium),
                                    SizedBox(height: 7.v),
                                    CustomDropDown(
                                        width: 160.h,
                                        icon: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                30.h, 16.v, 16.h, 14.v),
                                            child: CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgArrowdown)),
                                        hintText: "lbl_painting".tr,
                                        hintStyle: theme.textTheme.labelLarge!,
                                        items: controller.collaborateModelObj
                                            .value.dropdownItemList!.value,
                                        contentPadding: EdgeInsets.only(
                                            left: 16.h,
                                            top: 11.v,
                                            bottom: 11.v),
                                        borderDecoration:
                                            DropDownStyleHelper.fillLightBlueA,
                                        filled: true,
                                        fillColor: appTheme.lightBlueA700
                                            .withOpacity(0.08),
                                        onChanged: (value) {
                                          controller.onSelected(value);
                                        }),
                                    SizedBox(height: 58.v),
                                    Text("msg_collaboration_listings".tr,
                                        style: theme.textTheme.titleMedium),
                                    SizedBox(height: 15.v),
                                    SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: IntrinsicWidth(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Expanded(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 20.v),
                                                      padding:
                                                          EdgeInsets.all(8.h),
                                                      decoration: AppDecoration
                                                          .outlineGray
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder8),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgRectangle11,
                                                                height: 180.v,
                                                                width: 264.h,
                                                                radius: BorderRadius
                                                                    .circular(
                                                                        8.h)),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 10
                                                                            .h,
                                                                        top: 12
                                                                            .v),
                                                                child: Text(
                                                                    "msg_harmony_of_nature"
                                                                        .tr,
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleSmall)),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 10
                                                                            .h,
                                                                        top: 7
                                                                            .v),
                                                                child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                          height: 30
                                                                              .v,
                                                                          width: 45
                                                                              .h,
                                                                          child: Stack(
                                                                              alignment: Alignment.centerRight,
                                                                              children: [
                                                                                CustomImageView(imagePath: ImageConstant.imgEllipse130x30, height: 30.adaptSize, width: 30.adaptSize, radius: BorderRadius.circular(15.h), alignment: Alignment.centerLeft),
                                                                                CustomImageView(imagePath: ImageConstant.imgEllipse11, height: 30.adaptSize, width: 30.adaptSize, radius: BorderRadius.circular(15.h), alignment: Alignment.centerRight)
                                                                              ])),
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 12.h,
                                                                              top: 7.v,
                                                                              bottom: 5.v),
                                                                          child: Text("msg_sarah_smith_david2".tr, style: theme.textTheme.bodyMedium))
                                                                    ])),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 10
                                                                            .h,
                                                                        top: 9
                                                                            .v),
                                                                child: Text(
                                                                    "msg_july_8_august"
                                                                        .tr,
                                                                    style: CustomTextStyles
                                                                        .bodyMediumLight)),
                                                            SizedBox(
                                                                height: 8.v),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: SizedBox(
                                                                    width:
                                                                        242.h,
                                                                    child: Text(
                                                                        "msg_sarah_s_intricate"
                                                                            .tr,
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: CustomTextStyles
                                                                            .bodyMediumBlack90001
                                                                            .copyWith(height: 1.50)))),
                                                            SizedBox(
                                                                height: 7.v),
                                                            CustomElevatedButton(
                                                                height: 35.v,
                                                                text:
                                                                    "lbl_curious"
                                                                        .tr,
                                                                onTap: () {
                                                                  onTapCurious();
                                                                }),
                                                            SizedBox(
                                                                height: 8.v)
                                                          ]))),
                                              Container(
                                                  height: 412.v,
                                                  width: 74.h,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 16.v),
                                                  decoration: AppDecoration
                                                      .outlineGray
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder8),
                                                  child: CustomIconButton(
                                                      height: 35.v,
                                                      width: 66.h,
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child:
                                                          CustomImageView())),
                                              Spacer(),
                                              Expanded(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 45.v),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8.v),
                                                      decoration: AppDecoration
                                                          .outlineGray
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder8),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(children: [
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgRectangle11180x264,
                                                                  height: 180.v,
                                                                  width: 264.h,
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          8.h)),
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgRectangle11180x264,
                                                                  height: 180.v,
                                                                  width: 264.h,
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          8.h),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              36.h))
                                                            ]),
                                                            SizedBox(
                                                                height: 9.v),
                                                            Row(children: [
                                                              Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SizedBox(
                                                                        width: 244
                                                                            .h,
                                                                        child: Text(
                                                                            "msg_ai_infused_sculpture"
                                                                                .tr,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: theme.textTheme.titleSmall!.copyWith(height: 1.40))),
                                                                    SizedBox(
                                                                        height:
                                                                            9.v),
                                                                    Row(
                                                                        children: [
                                                                          SizedBox(
                                                                              height: 30.v,
                                                                              width: 45.h,
                                                                              child: Stack(alignment: Alignment.centerRight, children: [
                                                                                CustomImageView(imagePath: ImageConstant.imgEllipse130x30, height: 30.adaptSize, width: 30.adaptSize, radius: BorderRadius.circular(15.h), alignment: Alignment.centerLeft),
                                                                                CustomImageView(imagePath: ImageConstant.imgEllipse11, height: 30.adaptSize, width: 30.adaptSize, radius: BorderRadius.circular(15.h), alignment: Alignment.centerRight)
                                                                              ])),
                                                                          Padding(
                                                                              padding: EdgeInsets.only(left: 21.h, top: 4.v, bottom: 4.v),
                                                                              child: Text("msg_mark_turner_aiart".tr, style: theme.textTheme.bodyMedium))
                                                                        ]),
                                                                    SizedBox(
                                                                        height:
                                                                            9.v),
                                                                    Text(
                                                                        "msg_august_3_september"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .bodyMediumLight),
                                                                    SizedBox(
                                                                        height:
                                                                            8.v),
                                                                    SizedBox(
                                                                        width: 244
                                                                            .h,
                                                                        child: Text(
                                                                            "msg_mark_s_bronze_sculpture"
                                                                                .tr,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: CustomTextStyles.bodyMediumBlack90001.copyWith(height: 1.50)))
                                                                  ]),
                                                              Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          56.h,
                                                                      bottom:
                                                                          2.v),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                            width: 244
                                                                                .h,
                                                                            child: Text("msg_ai_infused_sculpture".tr,
                                                                                maxLines: null,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: theme.textTheme.titleSmall!.copyWith(height: 1.40))),
                                                                        SizedBox(
                                                                            height:
                                                                                8.v),
                                                                        Row(children: [
                                                                          SizedBox(
                                                                              height: 30.v,
                                                                              width: 45.h,
                                                                              child: Stack(alignment: Alignment.centerRight, children: [
                                                                                CustomImageView(imagePath: ImageConstant.imgEllipse130x30, height: 30.adaptSize, width: 30.adaptSize, radius: BorderRadius.circular(15.h), alignment: Alignment.centerLeft),
                                                                                CustomImageView(imagePath: ImageConstant.imgEllipse11, height: 30.adaptSize, width: 30.adaptSize, radius: BorderRadius.circular(15.h), alignment: Alignment.centerRight)
                                                                              ])),
                                                                          Padding(
                                                                              padding: EdgeInsets.only(left: 12.h, top: 6.v, bottom: 6.v),
                                                                              child: Text("msg_mark_turner_aiart".tr, style: CustomTextStyles.bodySmallLato))
                                                                        ]),
                                                                        SizedBox(
                                                                            height:
                                                                                8.v),
                                                                        Text(
                                                                            "msg_august_3_september"
                                                                                .tr,
                                                                            style:
                                                                                CustomTextStyles.bodyMediumLight),
                                                                        SizedBox(
                                                                            height:
                                                                                8.v),
                                                                        SizedBox(
                                                                            width: 244
                                                                                .h,
                                                                            child: Text("msg_mark_s_bronze_sculpture".tr,
                                                                                maxLines: null,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: CustomTextStyles.bodyMediumBlack90001.copyWith(height: 1.50)))
                                                                      ]))
                                                            ]),
                                                            SizedBox(
                                                                height: 5.v)
                                                          ])))
                                            ])))
                                  ]))))
                ])),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home2:
        return AppRoutes.homePage;
      case BottomBarEnum.Marketplace2:
        return "/";
      case BottomBarEnum.Community2:
        return "/";
      case BottomBarEnum.Collaborate:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the collaborateitemScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the collaborateitemScreen.
  onTapCurious() {
    Get.toNamed(
      AppRoutes.collaborateitemScreen,
    );
  }
}
