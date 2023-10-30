import '../art_community_screen/widgets/userprofile_item_widget.dart';
import 'controller/art_community_controller.dart';
import 'models/userprofile_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';
import 'package:artohmapp/presentation/collaborate_screen/collaborate_screen.dart';
import 'package:artohmapp/widgets/custom_bottom_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ArtCommunityScreen extends GetWidget<ArtCommunityController> {
  const ArtCommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.h, vertical: 7.v),
                                  decoration: AppDecoration.outlineBlack900013,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant.imgMask,
                                            height: 10.v,
                                            width: 49.h,
                                            alignment: Alignment.centerRight),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 9.h,
                                                top: 21.v,
                                                bottom: 7.v),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowleftRed300,
                                                  height: 28.adaptSize,
                                                  width: 28.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      6.h),
                                                  onTap: () {
                                                    onTapImgArrowleftone();
                                                  }),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 36.h,
                                                      top: 5.v,
                                                      bottom: 2.v),
                                                  child: Text(
                                                      "lbl_community2".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumInter))
                                            ]))
                                      ])),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 358.h,
                                      margin: EdgeInsets.only(
                                          left: 16.h, top: 21.v, right: 16.h),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.h, vertical: 6.v),
                                      decoration: AppDecoration.outlineRed300
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("lbl_featured_artist".tr,
                                                style: theme
                                                    .textTheme.titleMedium),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 17.v, right: 31.h),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgEllipse160x60,
                                                          height: 60.adaptSize,
                                                          width: 60.adaptSize,
                                                          radius: BorderRadius
                                                              .circular(30.h),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom:
                                                                      22.v)),
                                                      Expanded(
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          16.h,
                                                                      top: 3.v),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "lbl_mia_thompson"
                                                                            .tr,
                                                                        style: CustomTextStyles
                                                                            .titleMediumLatoBlack90001),
                                                                    SizedBox(
                                                                        height:
                                                                            10.v),
                                                                    SizedBox(
                                                                        width: 218
                                                                            .h,
                                                                        child: Text(
                                                                            "msg_art_is_my_way_of"
                                                                                .tr,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style: CustomTextStyles.bodyLargeBlack90001_5.copyWith(height: 1.50)))
                                                                  ])))
                                                    ])),
                                            SizedBox(height: 4.v),
                                            CustomElevatedButton(
                                                height: 28.v,
                                                width: 109.h,
                                                text: "lbl_discover_more".tr,
                                                buttonTextStyle: CustomTextStyles
                                                    .labelLargeRobotoWhiteA700,
                                                onTap: () {
                                                  onTapDiscovermore();
                                                },
                                                alignment:
                                                    Alignment.centerRight)
                                          ]))),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsets.only(left: 16.h, top: 44.v),
                                  child: IntrinsicWidth(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                        Expanded(
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                              Container(
                                                  decoration: AppDecoration
                                                      .fillPrimary1
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
                                                            imagePath: ImageConstant
                                                                .imgRectangle10,
                                                            height: 69.v,
                                                            width: 165.h,
                                                            radius: BorderRadius
                                                                .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            8.h))),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 9.h,
                                                                    top: 10.v,
                                                                    bottom:
                                                                        7.v),
                                                            child: Text(
                                                                "lbl_art_techniques"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelLargeBlack90001))
                                                      ])),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 7.h),
                                                  decoration: AppDecoration
                                                      .fillPrimary1
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
                                                            imagePath: ImageConstant
                                                                .imgRectangle1069x165,
                                                            height: 69.v,
                                                            width: 165.h,
                                                            radius: BorderRadius
                                                                .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            8.h))),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 10.h,
                                                                    top: 10.v,
                                                                    bottom:
                                                                        7.v),
                                                            child: Text(
                                                                "lbl_inspiration"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelLargeBlack90001))
                                                      ]))
                                            ])),
                                        Container(
                                            margin: EdgeInsets.only(left: 7.h),
                                            decoration: AppDecoration
                                                .fillPrimary1
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle101,
                                                      height: 69.v,
                                                      width: 165.h,
                                                      radius:
                                                          BorderRadius.vertical(
                                                              top: Radius
                                                                  .circular(
                                                                      8.h))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.h,
                                                          top: 8.v,
                                                          bottom: 9.v),
                                                      child: Text(
                                                          "lbl_collaborations"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .labelLargeBlack90001))
                                                ]))
                                      ]))),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, top: 44.v),
                                  child: Text("lbl_forum_threads".tr,
                                      style: theme.textTheme.titleMedium)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.h, top: 25.v, right: 16.h),
                                  child: Obx(() => ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 36.v);
                                      },
                                      itemCount: controller
                                          .artCommunityModelObj
                                          .value
                                          .userprofileItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                        UserprofileItemModel model = controller
                                            .artCommunityModelObj
                                            .value
                                            .userprofileItemList
                                            .value[index];
                                        return UserprofileItemWidget(model);
                                      }))),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, top: 46.v),
                                  child: Text("msg_upcoming_events".tr,
                                      style: theme.textTheme.titleMedium)),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      EdgeInsets.only(left: 16.h, top: 15.v),
                                  child: IntrinsicWidth(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                        SizedBox(
                                            height: 200.v,
                                            width: 260.h,
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle11200x260,
                                                      height: 200.v,
                                                      width: 260.h,
                                                      radius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 158.v),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      19.h,
                                                                  vertical:
                                                                      4.v),
                                                          decoration: AppDecoration
                                                              .fillPrimary
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .customBorderBL8),
                                                          child: Row(children: [
                                                            SizedBox(
                                                                width: 144.h,
                                                                child: Text(
                                                                    "msg_art_unveiling_exploring"
                                                                        .tr,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: CustomTextStyles
                                                                        .labelLargeWhiteA700
                                                                        .copyWith(
                                                                            height:
                                                                                1.40))),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgIconsWhiteA700,
                                                                height: 20.v,
                                                                width: 4.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 54
                                                                            .h,
                                                                        top:
                                                                            6.v,
                                                                        bottom:
                                                                            6.v),
                                                                onTap: () {
                                                                  onTapImgIconsoneoneone();
                                                                })
                                                          ])))
                                                ])),
                                        Container(
                                            height: 200.v,
                                            width: 260.h,
                                            margin: EdgeInsets.only(left: 16.h),
                                            child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle11200x260,
                                                      height: 200.v,
                                                      width: 260.h,
                                                      radius:
                                                          BorderRadius.circular(
                                                              8.h),
                                                      alignment:
                                                          Alignment.center),
                                                  Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 158.v),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.h,
                                                                  vertical:
                                                                      4.v),
                                                          decoration: AppDecoration
                                                              .fillPrimary
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .customBorderBL8),
                                                          child: Row(children: [
                                                            SizedBox(
                                                                width: 144.h,
                                                                child: Text(
                                                                    "msg_art_unveiling_exploring"
                                                                        .tr,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: CustomTextStyles
                                                                        .labelLargeWhiteA700
                                                                        .copyWith(
                                                                            height:
                                                                                1.40))),
                                                            CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgIconsWhiteA700,
                                                                height: 20.v,
                                                                width: 4.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left: 54
                                                                            .h,
                                                                        top:
                                                                            6.v,
                                                                        bottom:
                                                                            6.v))
                                                          ])))
                                                ]))
                                      ]))),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, top: 44.v),
                                  child: Text(
                                      "msg_featured_art_collaboration".tr,
                                      style: theme.textTheme.titleMedium)),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left: 16.h, top: 17.v, right: 16.h),
                                      padding: EdgeInsets.all(8.h),
                                      decoration: AppDecoration.outlineGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgRectangle11,
                                                height: 180.v,
                                                width: 342.h,
                                                radius:
                                                    BorderRadius.circular(8.h)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.h, top: 12.v),
                                                child: Text(
                                                    "msg_harmony_of_nature".tr,
                                                    style: theme
                                                        .textTheme.titleSmall)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.h, top: 7.v),
                                                child: Row(children: [
                                                  SizedBox(
                                                      height: 30.v,
                                                      width: 45.h,
                                                      child: Stack(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          children: [
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
                                                                alignment: Alignment
                                                                    .centerLeft),
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
                                                                alignment: Alignment
                                                                    .centerRight)
                                                          ])),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 12.h,
                                                          top: 7.v,
                                                          bottom: 5.v),
                                                      child: Text(
                                                          "msg_sarah_smith_david2"
                                                              .tr,
                                                          style: theme.textTheme
                                                              .bodyMedium))
                                                ])),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.h, top: 9.v),
                                                child: Text(
                                                    "msg_july_8_august".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumLight)),
                                            SizedBox(height: 8.v),
                                            CustomElevatedButton(
                                                height: 35.v,
                                                text: "lbl_curious".tr),
                                            SizedBox(height: 8.v)
                                          ]))),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.h, top: 46.v),
                                  child: Text("lbl_explore_artists".tr,
                                      style: theme.textTheme.titleMedium)),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.h, top: 15.v, right: 45.h),
                                  child: Row(children: [
                                    GestureDetector(
                                        onTap: () {
                                          onTapColumn();
                                        },
                                        child: Column(children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgEllipse180x80,
                                              height: 80.adaptSize,
                                              width: 80.adaptSize,
                                              radius:
                                                  BorderRadius.circular(40.h)),
                                          SizedBox(height: 11.v),
                                          Text("lbl_oliver_reynolds".tr,
                                              style: CustomTextStyles
                                                  .bodyMediumBlack900)
                                        ])),
                                    GestureDetector(
                                        onTap: () {
                                          onTapColumn1();
                                        },
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 24.h),
                                            child: Column(children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgImg,
                                                  height: 80.adaptSize,
                                                  width: 80.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      40.h)),
                                              SizedBox(height: 11.v),
                                              Text("lbl_mia_thompson".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumBlack900)
                                            ]))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapColumn2();
                                        },
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 24.h),
                                            child: Column(children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgImg,
                                                  height: 80.adaptSize,
                                                  width: 80.adaptSize,
                                                  radius: BorderRadius.circular(
                                                      40.h)),
                                              SizedBox(height: 11.v),
                                              Text("lbl_mia_thompson".tr,
                                                  style: CustomTextStyles
                                                      .bodyMediumBlack900)
                                            ])))
                                  ]))
                            ])))),
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
        return AppRoutes.artMarketplaceScreen;
      case BottomBarEnum.Community2:
        return AppRoutes.artCommunityScreen;
      case BottomBarEnum.Collaborate:
        return AppRoutes.collaborateScreen;
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
        return HomePage();
    }
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapImgArrowleftone() {
    Get.back();
  }

  /// Navigates to the artistProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artistProfileScreen.
  onTapDiscovermore() {
    Get.toNamed(
      AppRoutes.artistProfileScreen,
    );
  }

  /// Navigates to the modalScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the modalScreen.
  onTapImgIconsoneoneone() {
    Get.toNamed(
      AppRoutes.modalScreen,
    );
  }

  /// Navigates to the artistProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artistProfileScreen.
  onTapColumn() {
    Get.toNamed(
      AppRoutes.artistProfileScreen,
    );
  }

  /// Navigates to the artistProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artistProfileScreen.
  onTapColumn1() {
    Get.toNamed(
      AppRoutes.artistProfileScreen,
    );
  }

  /// Navigates to the artistProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artistProfileScreen.
  onTapColumn2() {
    Get.toNamed(
      AppRoutes.artistProfileScreen,
    );
  }
}
