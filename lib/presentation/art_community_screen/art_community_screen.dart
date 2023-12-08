import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';

import '../../widgets/app_bar/appbar_image_1.dart';
import '../../widgets/custom_appbar_component.dart';
import '../art_community_screen/widgets/userprofile_item_widget.dart';
import 'controller/art_community_controller.dart';
import 'models/userprofile_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';
import 'package:artohmapp/presentation/collaborate_screen/collaborate_screen.dart';
import 'package:artohmapp/widgets/custom_bottom_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
// import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
// lib/presentation/modal_screen/modal_screen.dart

class ArtCommunityScreen extends GetWidget<ArtCommunityController> {
  // removed keyword const
  ArtCommunityScreen({Key? key}) : super(key: key);
  final ModalScreen modalScreen = ModalScreen();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBarComponent(title: "lbl_community2".tr),

      body: bodyContent(context),
      // bottomNavigationBar:
      //     CustomBottomBar(onChanged: (BottomBarEnum type) {
      //   Get.toNamed(getCurrentRoute(type), id: 1);
      // })
    ));
  }

  bodyContent(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 358.h,
                  margin: EdgeInsets.only(left: 16.h, top: 21.v, right: 16.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.v),
                  decoration: AppDecoration.outlineRed300
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_featured_artist".tr,
                          style: theme.textTheme.titleMedium),
                      Padding(
                        padding: EdgeInsets.only(top: 17.v, right: 31.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgEllipse160x60,
                                height: 60.adaptSize,
                                width: 60.adaptSize,
                                radius: BorderRadius.circular(30.h),
                                margin: EdgeInsets.only(bottom: 22.v)),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.h, top: 3.v),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("lbl_mia_thompson".tr,
                                        style: CustomTextStyles
                                            .titleMediumLatoBlack90001),
                                    SizedBox(height: 10.v),
                                    SizedBox(
                                      width: 218.h,
                                      child: Text(
                                        "msg_art_is_my_way_of".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .bodyLargeBlack90001_5
                                            .copyWith(height: 1.50),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.v),
                      CustomElevatedButton(
                          height: 28.v,
                          width: 109.h,
                          text: "lbl_discover_more".tr,
                          buttonTextStyle:
                              CustomTextStyles.labelLargeRobotoWhiteA700,
                          onTap: () {
                            onTapDiscovermore();
                          },
                          alignment: Alignment.centerRight)
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16.h, top: 44.v),
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Container(
                              decoration: AppDecoration.fillPrimary1.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgRectangle10,
                                      height: 69.v,
                                      width: 165.h,
                                      radius: BorderRadius.vertical(
                                          top: Radius.circular(8.h))),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 9.h, top: 10.v, bottom: 7.v),
                                    child: Text("lbl_art_techniques".tr,
                                        style: CustomTextStyles
                                            .labelLargeBlack90001),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 7.h),
                                decoration: AppDecoration.fillPrimary1.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgRectangle1069x165,
                                          height: 69.v,
                                          width: 165.h,
                                          radius: BorderRadius.vertical(
                                              top: Radius.circular(8.h))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.h,
                                              top: 10.v,
                                              bottom: 7.v),
                                          child: Text("lbl_inspiration".tr,
                                              style: CustomTextStyles
                                                  .labelLargeBlack90001))
                                    ]))
                          ])),
                      Container(
                        margin: EdgeInsets.only(left: 7.h),
                        decoration: AppDecoration.fillPrimary1.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle101,
                                height: 69.v,
                                width: 165.h,
                                radius: BorderRadius.vertical(
                                    top: Radius.circular(8.h))),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10.h, top: 8.v, bottom: 9.v),
                              child: Text("lbl_collaborations".tr,
                                  style: CustomTextStyles.labelLargeBlack90001),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 44.v),
                  child: Text("lbl_forum_threads".tr,
                      style: theme.textTheme.titleMedium)),
              Padding(
                padding: EdgeInsets.only(left: 16.h, top: 25.v, right: 16.h),
                child: Obx(
                  () => ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 36.v);
                    },
                    itemCount: controller.artCommunityModelObj.value
                        .userprofileItemList.value.length,
                    itemBuilder: (context, index) {
                      UserprofileItemModel model = controller
                          .artCommunityModelObj
                          .value
                          .userprofileItemList
                          .value[index];
                      return UserprofileItemWidget(model);
                    },
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 46.v, right: 16.h),
                  child: Text("msg_upcoming_events".tr,
                      style: theme.textTheme.titleMedium)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16.h, top: 15.v),
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          height: 200.v,
                          width: 260.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgRectangle11200x260,
                                  height: 200.v,
                                  width: 260.h,
                                  radius: BorderRadius.circular(8.h),
                                  alignment: Alignment.center),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.only(top: 158.v),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19.h, vertical: 4.v),
                                  decoration: AppDecoration.fillPrimary
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderBL8),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 144.h,
                                          child: Text(
                                              "msg_art_unveiling_exploring".tr,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: CustomTextStyles
                                                  .labelLargeWhiteA700
                                                  .copyWith(height: 1.40))),
                                      CustomImageView(
                                        svgPath:
                                            ImageConstant.imgIconsWhiteA700,
                                        height: 20.v,
                                        width: 18.h,
                                        margin: EdgeInsets.only(
                                            left: 54.h, top: 6.v, bottom: 6.v),
                                        onTap: () {
                                          showModal(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200.v,
                        width: 260.h,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle11200x260,
                                height: 200.v,
                                width: 260.h,
                                radius: BorderRadius.circular(8.h),
                                alignment: Alignment.center),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 158.v),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 19.h, vertical: 4.v),
                                decoration: AppDecoration.fillPrimary.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderBL8),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 144.h,
                                        child: Text(
                                            "msg_art_unveiling_exploring".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .labelLargeWhiteA700
                                                .copyWith(height: 1.40))),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgIconsWhiteA700,
                                      height: 20.v,
                                      width: 18.h,
                                      margin: EdgeInsets.only(
                                          left: 54.h, top: 6.v, bottom: 6.v),
                                      onTap: () {
                                        showModal(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 44.v),
                  child: Text("msg_featured_art_collaboration".tr,
                      style: theme.textTheme.titleMedium)),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(left: 16.h, top: 17.v, right: 16.h),
                  padding: EdgeInsets.all(8.h),
                  decoration: AppDecoration.outlineGray
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
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
                                          imagePath:
                                              ImageConstant.imgEllipse130x30,
                                          height: 30.adaptSize,
                                          width: 30.adaptSize,
                                          radius: BorderRadius.circular(15.h),
                                          alignment: Alignment.centerLeft),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgEllipse11,
                                          height: 30.adaptSize,
                                          width: 30.adaptSize,
                                          radius: BorderRadius.circular(15.h),
                                          alignment: Alignment.centerRight)
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
                      SizedBox(height: 8.v),
                      CustomElevatedButton(
                          height: 35.v, text: "lbl_curious".tr),
                      SizedBox(height: 8.v)
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 46.v),
                  child: Text("lbl_explore_artists".tr,
                      style: theme.textTheme.titleMedium)),
              artists()
            ],
          ),
        ),
      ),
    );
  }

  artists() {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, top: 15.v, right: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.only(left: 16.h, top: 15.v),
        child: IntrinsicWidth(
          child: Row(
            children: [
              buildArtistColumn(
                onTap: onTapColumn,
                imagePath: ImageConstant.imgEllipse180x80,
                labelText: "lbl_oliver_reynolds".tr,
              ),
              buildArtistColumn(
                onTap: onTapColumn1,
                imagePath: ImageConstant.imgImg,
                labelText: "lbl_mia_thompson".tr,
              ),
              buildArtistColumn(
                onTap: onTapColumn2,
                imagePath: ImageConstant.imgImg,
                labelText: "lbl_mia_thompson".tr,
              ),
              buildArtistColumn(
                onTap: onTapColumn2,
                imagePath: ImageConstant.imgImg,
                labelText: "lbl_mia_thompson".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildArtistColumn({
    required VoidCallback onTap,
    required String imagePath,
    required String labelText,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(left: 24.h),
          child: Column(
            children: [
              CustomImageView(
                imagePath: imagePath,
                height: 80.adaptSize,
                width: 80.adaptSize,
                radius: BorderRadius.circular(40.h),
              ),
              SizedBox(height: 11.v),
              Text(labelText, style: CustomTextStyles.bodyMediumBlack900),
            ],
          ),
        ),
      ),
    );
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

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 0.94,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFEE9E9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              border: Border.all(
                color: Color.fromRGBO(245, 140, 140, 0.075),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 4.0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 13.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 12.v),
                Text(
                  "msg_art_unveiling_exploring2".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 18.v),
                Text(
                  "lbl_july_30_2023".tr,
                  style: CustomTextStyles.titleMediumLato,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 2.h,
                    top: 12.v,
                  ),
                  child: Text(
                    "msg_artverse_gallery".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Container(
                  width: 336.h,
                  margin: EdgeInsets.only(
                    top: 10.v,
                    right: 21.h,
                  ),
                  child: Text(
                    "msg_join_me_in_unveiling".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  text: "lbl_book_ticket".tr,
                  margin: EdgeInsets.only(
                    top: 16.v,
                    left: 16.h,
                    right: 16.h,
                    bottom: 24.v,
                  ),
                  buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
