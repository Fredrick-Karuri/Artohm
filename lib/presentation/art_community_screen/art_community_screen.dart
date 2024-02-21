import 'package:artohmapp/presentation/art_community_screen/widgets/community_filter_widget.dart';
import 'package:artohmapp/presentation/modal_screen/controller/modal_controller.dart';
import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
import '../../widgets/custom_appbar_component.dart';
import '../../widgets/upcoming_events.dart';
import '../art_community_screen/widgets/userprofile_item_widget.dart';
import 'controller/art_community_controller.dart';
import 'models/userprofile_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
// import 'package:artohmapp/presentation/modal_screen/modal_screen.dart';
// lib/presentation/modal_screen/modal_screen.dart

class ArtCommunityScreen extends GetWidget<ArtCommunityController> {
  // removed keyword const
  ArtCommunityScreen({Key? key}) : super(key: key);

  // Create a ModalController
  ModalController modalController = ModalController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "lbl_community2".tr,
          onBackPressed: () {
            Get.back(id: 1);
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
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.v, top: 16.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              featuredArtist(),
              filters(),
              threads(),
              events(context),
              collaboration(),
              artists()
            ],
          ),
        ),
      ),
    );
  }

  featuredArtist() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 358.h,
        margin: EdgeInsets.only(left: 16.h, right: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.v),
        decoration: AppDecoration.outlineRed300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "lbl_featured_artist".tr,
                  style: theme.textTheme.titleMedium,
                ),
                CustomElevatedButton(
                  height: 28.v,
                  width: 109.h,
                  text: "lbl_discover_more".tr,
                  buttonTextStyle: CustomTextStyles.labelLargeRobotoWhiteA700,
                  onTap: () {
                    onTapDiscovermore();
                  },
                  alignment: Alignment.centerRight,
                )
              ],
            ),
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
                              style:
                                  CustomTextStyles.titleMediumLatoBlack90001),
                          SizedBox(height: 10.v),
                          SizedBox(
                            width: 218.h,
                            child: Text(
                              "msg_art_is_my_way_of".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyLargeBlack90001_5
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
          ],
        ),
      ),
    );
  }

  filters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 16.h, top: 32.v),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommunityFilterWidget(
                      onTap: () {},
                      imagePath: ImageConstant.imgRectangle10,
                      text: "lbl_art_techniques".tr),
                  CommunityFilterWidget(
                      onTap: () {},
                      imagePath: ImageConstant.imgRectangle1069x165,
                      text: "lbl_inspiration".tr),
                  CommunityFilterWidget(
                      onTap: () {},
                      imagePath: ImageConstant.imgRectangle101,
                      text: "lbl_collaborations".tr),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  threads() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h, top: 44.v),
          child:
              Text("lbl_forum_threads".tr, style: theme.textTheme.titleMedium),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h, top: 25.v, right: 16.h),
          child: Obx(
            () => ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 36.v);
              },
              itemCount: controller
                  .artCommunityModelObj.value.userprofileItemList.value.length,
              itemBuilder: (context, index) {
                UserprofileItemModel model = controller.artCommunityModelObj
                    .value.userprofileItemList.value[index];
                return UserprofileItemWidget(model);
              },
            ),
          ),
        ),
      ],
    );
  }

  events(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

  collaboration() {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("msg_featured_art_collaboration".tr,
              style: theme.textTheme.titleMedium),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 16.v, right: 16.h),
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
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30.v,
                          width: 45.h,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgEllipse130x30,
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
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 12.h, top: 7.v, bottom: 5.v),
                            child: Text("msg_sarah_smith_david2".tr,
                                style: theme.textTheme.bodyMedium))
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, top: 9.v),
                      child: Text("msg_july_8_august".tr,
                          style: CustomTextStyles.bodyMediumLight)),
                  SizedBox(height: 8.v),
                  CustomElevatedButton(
                      onTap: () {
                        Get.toNamed(AppRoutes.collaborateitemScreen);
                      },
                      height: 35.v,
                      text: "lbl_curious".tr),
                  SizedBox(height: 8.v)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  artists() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_explore_artists".tr, style: theme.textTheme.titleMedium),
          Padding(
            padding: EdgeInsets.only(top: 15.v),
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
          ),
        ],
      ),
    );
  }

  buildArtistColumn({
    required VoidCallback onTap,
    required String imagePath,
    required String labelText,
  }) {
    return Card(
      color: Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              CustomImageView(
                imagePath: imagePath,
                height: 80.adaptSize,
                width: 80.adaptSize,
                radius: BorderRadius.circular(40.h),
              ),
              SizedBox(height: 10.v),
              Text(labelText, style: CustomTextStyles.bodyMediumBlack900),
            ],
          ),
        ),
      ),
    );
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
