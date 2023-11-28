import '../art_marketplace_screen/widgets/marketplacechip_item_widget.dart';
import 'controller/art_marketplace_controller.dart';
import 'models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_bottom_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ArtMarketplaceScreen extends GetWidget<ArtMarketplaceController> {
  const ArtMarketplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          leadingWidth: 46.h,
          leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftRed300,
              margin: EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
              onTap: () {
                // Navigator.pop(context);
                Get.back(id: 1);
              }),
          title: AppbarSubtitle1(
              text: "lbl_market_place2".tr,
              margin: EdgeInsets.only(left: 36.h, top: 41.v, bottom: 18.v)),
          actions: [
            AppbarImage1(
                svgPath: ImageConstant.imgMask,
                margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v))
          ],
          styleType: Style.bgFill),
      body: SizedBox(
          width: double.maxFinite,
          child: Column(children: [
            SizedBox(height: 17.v),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.h, bottom: 32.v, right: 16.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(
                                () => GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 81.v,
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 8.h,
                                          crossAxisSpacing: 8.h),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: controller
                                      .artMarketplaceModelObj
                                      .value
                                      .marketplacechipItemList
                                      .value
                                      .length,
                                  itemBuilder: (context, index) {
                                    MarketplacechipItemModel model = controller
                                        .artMarketplaceModelObj
                                        .value
                                        .marketplacechipItemList
                                        .value[index];
                                    return MarketplacechipItemWidget(model);
                                  },
                                ),
                              ),
                              SizedBox(height: 32.v),
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgRectangle11332x358,
                                  height: 332.v,
                                  width: 358.h,
                                  radius: BorderRadius.circular(8.h)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.v, right: 16.h),
                                  child: Column(children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "msg_ethereal_enchantment"
                                                          .tr,
                                                      style: theme.textTheme
                                                          .titleMedium),
                                                  SizedBox(height: 17.v),
                                                  Text("lbl_sophia_anderson".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack90001)
                                                ]),
                                          ),
                                          Flexible(
                                            child: CustomOutlinedButton(
                                                height: 38.v,
                                                width: 64.h,
                                                text: "lbl_850".tr,
                                                margin: EdgeInsets.only(
                                                    left: 95.h,
                                                    top: 8.v,
                                                    bottom: 8.v),
                                                buttonTextStyle: theme
                                                    .textTheme.titleMedium!),
                                          )
                                        ]),
                                    SizedBox(height: 24.v),
                                    CustomElevatedButton(
                                        text: "lbl_view_artwork".tr,
                                        buttonTextStyle: CustomTextStyles
                                            .titleSmallRobotoWhiteA700Medium,
                                        onTap: () {
                                          onTapViewartwork();
                                        })
                                  ])),
                              SizedBox(height: 32.v),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
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
                                              Column(children: [
                                                SizedBox(
                                                    height: 200.v,
                                                    width: 176.h,
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        children: [
                                                          CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgRectangle1120,
                                                              height: 200.v,
                                                              width: 176.h,
                                                              radius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.h),
                                                              alignment:
                                                                  Alignment
                                                                      .center),
                                                          CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgIconsWhiteA700,
                                                              height: 20.v,
                                                              width: 4.h,
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          18.h,
                                                                      bottom:
                                                                          10.v))
                                                        ])),
                                                SizedBox(height: 12.v),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 2.v),
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                    "lbl_sunset_serenity"
                                                                        .tr,
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleSmall),
                                                                SizedBox(
                                                                    height:
                                                                        7.v),
                                                                Text(
                                                                    "lbl_emily_davis"
                                                                        .tr,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyMedium)
                                                              ])),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 28.h,
                                                                  bottom: 28.v),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      2.h,
                                                                  vertical:
                                                                      1.v),
                                                          decoration: AppDecoration
                                                              .outlinePrimary
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder4),
                                                          child: Text(
                                                              "lbl_620".tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .labelMedium))
                                                    ])
                                              ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.h),
                                                  child: Column(children: [
                                                    SizedBox(
                                                        height: 200.v,
                                                        width: 176.h,
                                                        child: Stack(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            children: [
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .imgRectangle1121,
                                                                  height: 200.v,
                                                                  width: 176.h,
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          8.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .center),
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgIconsWhiteA700,
                                                                  height: 20.v,
                                                                  width: 4.h,
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomRight,
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          18.h,
                                                                      bottom:
                                                                          10.v))
                                                            ])),
                                                    SizedBox(height: 12.v),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 2.v),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "lbl_sunset_serenity"
                                                                            .tr,
                                                                        style: theme
                                                                            .textTheme
                                                                            .titleSmall),
                                                                    SizedBox(
                                                                        height:
                                                                            7.v),
                                                                    Text(
                                                                        "lbl_emily_davis"
                                                                            .tr,
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyMedium)
                                                                  ])),
                                                          Container(
                                                              margin:
                                                                  EdgeInsets.only(
                                                                      left:
                                                                          28.h,
                                                                      bottom:
                                                                          28.v),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2.h,
                                                                      vertical:
                                                                          1.v),
                                                              decoration: AppDecoration
                                                                  .outlinePrimary
                                                                  .copyWith(
                                                                      borderRadius:
                                                                          BorderRadiusStyle
                                                                              .roundedBorder4),
                                                              child: Text(
                                                                  "lbl_620".tr,
                                                                  style: theme
                                                                      .textTheme
                                                                      .labelMedium))
                                                        ])
                                                  ]))
                                            ])),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 12.h),
                                            child: Column(children: [
                                              SizedBox(
                                                  height: 200.v,
                                                  width: 176.h,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      children: [
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgRectangle1120,
                                                            height: 200.v,
                                                            width: 176.h,
                                                            radius: BorderRadius
                                                                .circular(8.h),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgIconsWhiteA700,
                                                            height: 20.v,
                                                            width: 4.h,
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 18.h,
                                                                    bottom:
                                                                        10.v))
                                                      ])),
                                              SizedBox(height: 12.v),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              "lbl_sunset_serenity"
                                                                  .tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall),
                                                          SizedBox(height: 4.v),
                                                          Text(
                                                              "lbl_emily_davis"
                                                                  .tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyMedium)
                                                        ]),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 28.h,
                                                            bottom: 29.v),
                                                        padding:
                                                            EdgeInsets.all(2.h),
                                                        decoration: AppDecoration
                                                            .outlinePrimary
                                                            .copyWith(
                                                                borderRadius:
                                                                    BorderRadiusStyle
                                                                        .roundedBorder4),
                                                        child: Text(
                                                            "lbl_620".tr,
                                                            style: theme
                                                                .textTheme
                                                                .labelMedium))
                                                  ])
                                            ]))
                                      ])))
                            ]))))
          ])),
      // bottomNavigationBar:
      //     CustomBottomBar(onChanged: (BottomBarEnum type) {
      //   Get.toNamed(getCurrentRoute(type), id: 1);
      // })
    ));
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
        return HomePage();
    }
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapViewartwork() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }
}
