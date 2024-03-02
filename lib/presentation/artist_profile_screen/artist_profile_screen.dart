import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import 'package:artohmapp/widgets/upcoming_events.dart';

import '../../widgets/custom_appbar_component.dart';
import 'controller/artist_profile_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ArtistProfileScreen extends GetWidget<ArtistProfileController> {
  const ArtistProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "lbl_artist".tr,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: bodyContent(context),
      ),
    );
  }

  bodyContent(BuildContext context) {
    return SizedBox(
      width: mediaQueryData.size.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16.v, bottom: 32.v),
        child: Padding(
          padding: EdgeInsets.only(left: 10.h, bottom: 5.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutArtist(),
              artworks(),
              events(context),
            ],
          ),
        ),
      ),
    );
  }

  events(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.v),
        Text("msg_upcoming_events".tr, style: theme.textTheme.titleMedium),
        SizedBox(height: 16.v),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UpcomingEventsCard(
                  onTap: () {
                    ModalScreenState.showModal(context);
                  },
                  imagePath: ImageConstant.imgRectangle11200x260,
                  text: "msg_art_unveiling_exploring".tr,
                ),
                UpcomingEventsCard(
                  onTap: () {
                    ModalScreenState.showModal(context);
                  },
                  imagePath: ImageConstant.imgRectangle11200x260,
                  text: "msg_art_unveiling_exploring".tr,
                ),
                UpcomingEventsCard(
                  onTap: () {
                    ModalScreenState.showModal(context);
                  },
                  imagePath: ImageConstant.imgRectangle11200x260,
                  text: "msg_art_unveiling_exploring".tr,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  artworks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 21.v),
        Text("lbl_from_sophia".tr, style: theme.textTheme.titleMedium),
        SizedBox(height: 15.v),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.v,
                        width: 160.h,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: 'artworkImage',
                              child: Material(
                                type: MaterialType.transparency,
                                child: CustomImageView(
                                    imagePath: ImageConstant.imgRectangle1117,
                                    height: 200.v,
                                    width: 160.h,
                                    radius: BorderRadius.circular(8.h),
                                    alignment: Alignment.center,
                                    onTap: () {
                                      onTapImgImageoneoneone();
                                    }),
                              ),
                            ),
                            CustomImageView(
                                svgPath: ImageConstant.imgIconsWhiteA700,
                                height: 20.v,
                                width: 4.h,
                                alignment: Alignment.bottomRight,
                                margin:
                                    EdgeInsets.only(right: 18.h, bottom: 10.v))
                          ],
                        ),
                      ),
                      Container(
                        height: 200.v,
                        width: 160.h,
                        margin: EdgeInsets.only(left: 16.h),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle1118,
                                height: 200.v,
                                width: 160.h,
                                radius: BorderRadius.circular(8.h),
                                alignment: Alignment.center,
                                onTap: () {
                                  onTapImgImageoneoneone1();
                                }),
                            CustomImageView(
                              svgPath: ImageConstant.imgIconsWhiteA700,
                              height: 20.v,
                              width: 4.h,
                              alignment: Alignment.bottomRight,
                              margin:
                                  EdgeInsets.only(right: 18.h, bottom: 10.v),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200.v,
                  width: 160.h,
                  margin: EdgeInsets.only(left: 16.h),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgRectangle1118,
                          height: 200.v,
                          width: 160.h,
                          radius: BorderRadius.circular(8.h),
                          alignment: Alignment.center),
                      CustomImageView(
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 20.v,
                        width: 4.h,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(right: 18.h, bottom: 10.v),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  aboutArtist() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        CustomImageView(
            imagePath: ImageConstant.imgEllipse1113x113,
            height: 113.adaptSize,
            width: 113.adaptSize,
            radius: BorderRadius.circular(56.h),
            alignment: Alignment.center),
        SizedBox(height: 18.v),
        Align(
            alignment: Alignment.center,
            child: Text("lbl_sophia_anderson".tr,
                style: theme.textTheme.titleMedium)),
        Container(
            width: 274.h,
            margin: EdgeInsets.only(left: 45.h, top: 9.v, right: 60.h),
            child: Text("msg_a_nature_enthusiast".tr,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyLargeBlack
                    .copyWith(height: 1.50))),
        SizedBox(height: 12.v),
        CustomElevatedButton(
            width: 160.h,
            text: "lbl_follow".tr,
            buttonTextStyle: CustomTextStyles.titleSmallRobotoWhiteA700Medium,
            alignment: Alignment.center),
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

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapImgImageoneoneone() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapImgImageoneoneone1() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }

  /// Navigates to the modalScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the modalScreen.
  ///
  // onTapImgIconssevenone() {
  //   Get.toNamed(
  //     AppRoutes.modalScreen,

  //   );
  // }
}
