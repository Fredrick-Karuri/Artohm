import 'package:artohmapp/presentation/user_profile_container_screen/widgets/profile_info.dart';

import '../user_profile_container_screen/widgets/collection_item_widget.dart';
import '../user_profile_container_screen/widgets/enchantedforest_item_widget.dart';
import 'controller/user_profile_container_controller.dart';
import 'models/collection_item_model.dart';
import 'models/enchantedforest_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class UserProfileContainerScreen
    extends GetWidget<UserProfileContainerController> {
  const UserProfileContainerScreen({Key? key}) : super(key: key);

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
                  Navigator.pop(context);
                }),
            title: AppbarTitle(
                text: "lbl_profile".tr,
                margin: EdgeInsets.only(left: 36.h, top: 39.v, bottom: 17.v)),
            actions: [
              Padding(
                  padding: EdgeInsets.fromLTRB(9.h, 9.v, 9.h, 9.v),
                  child: AppbarImage1(
                      svgPath: ImageConstant.imgProfileicons,
                      margin: EdgeInsets.only(top: 24.v, right: 24.h),
                      onTap: () {
                        onTapProfileicons();
                      }))
            ],
            styleType: Style.bgFill),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24.v, bottom: 32.v),
            child: Padding(
              padding: EdgeInsets.only(left: 15.h, bottom: 5.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileInfoCard(),
                  yourWork(),
                  collections(),
                  SizedBox(
                    height: 24,
                  ),
                  communityEngagement(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  collections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.h, top: 53.v),
          child: Text("lbl_collections".tr, style: theme.textTheme.titleMedium),
        ),
        SizedBox(height: 17.v),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            children: [
              Flexible(
                child: SizedBox(
                  height: 200.v,
                  // height: double.infinity,
                  child: Obx(
                    () => ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16.h);
                      },
                      itemCount: controller.userProfileContainerModelObj.value
                          .collectionItemList.value.length,
                      itemBuilder: (context, index) {
                        CollectionItemModel model = controller
                            .userProfileContainerModelObj
                            .value
                            .collectionItemList
                            .value[index];
                        return CollectionItemWidget(model);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomOutlinedButton(
            text: "msg_create_collection".tr,
            margin: EdgeInsets.only(top: 23.v, right: 16.h),
            buttonTextStyle: CustomTextStyles.titleSmallRobotoRed300,
            onTap: () {
              onTapCreate();
            }),
      ],
    );
  }

  communityEngagement() {
    return Container(
      width: 360.h,
      margin: EdgeInsets.only(right: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 7.h, vertical: 15.v),
      decoration: AppDecoration.outlineRed
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onTapImgArrowrightone();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 4.v, right: 16.h),
              child: Row(
                children: [
                  Text("msg_art_community_engagement".tr,
                      style: theme.textTheme.titleMedium),
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowrightRed300,
                    height: 18.v,
                    width: 10.h,
                    margin: EdgeInsets.only(left: 69.h, bottom: 2.v),
                    onTap: () {
                      onTapImgArrowrightone();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Text("lbl_recent_comments".tr, style: theme.textTheme.bodyLarge),
          Padding(
              padding: EdgeInsets.only(left: 4.h, top: 11.v),
              child: Text("msg_beautiful_use_of".tr,
                  style: CustomTextStyles.bodyMediumBlack90001)),
          Container(
              width: 289.h,
              margin: EdgeInsets.only(left: 4.h, top: 7.v, right: 48.h),
              child: Text("msg_your_creations".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumBlack90001)),
          Container(
              width: 289.h,
              margin: EdgeInsets.only(left: 4.h, top: 7.v, right: 48.h),
              child: Text("msg_your_creations".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumBlack90001)),
        ],
      ),
    );
  }

  Column yourWork() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.h, top: 53.v, right: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 5.v, bottom: 7.v),
                  child: Text("lbl_your_work".tr,
                      style: theme.textTheme.titleMedium)),
              CustomOutlinedButton(
                  width: 107.h,
                  text: "lbl_121_artworks".tr,
                  buttonStyle: CustomButtonStyles.outlineLightBlueATL4,
                  buttonTextStyle:
                      CustomTextStyles.titleSmallLatoLightblueA700Medium)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.v, right: 25.h),
          child: Obx(
            () => GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 172.v,
                  crossAxisCount: 3,
                  mainAxisSpacing: 13.h,
                  crossAxisSpacing: 13.h),
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.userProfileContainerModelObj.value
                  .enchantedforestItemList.value.length,
              itemBuilder: (context, index) {
                EnchantedforestItemModel model = controller
                    .userProfileContainerModelObj
                    .value
                    .enchantedforestItemList
                    .value[index];
                return EnchantedforestItemWidget(model);
              },
            ),
          ),
        ),
        CustomOutlinedButton(
          text: "lbl_add_new".tr,
          margin: EdgeInsets.only(top: 23.v, right: 16.h),
          onTap: () {
            onTapAddnew();
          },
        ),
      ],
    );
  }

  Container profileInfoCard() {
    return Container(
      margin: EdgeInsets.only(right: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 16.v),
      decoration: AppDecoration.outlineBlack900011
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgEllipse12,
                    height: 80.adaptSize,
                    width: 80.adaptSize,
                    radius: BorderRadius.circular(40.h)),
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_sophia_anderson".tr,
                          style: theme.textTheme.titleMedium),
                      Padding(
                          padding: EdgeInsets.only(left: 4.h, top: 5.v),
                          child: Text("lbl_artlover1".tr,
                              style:
                                  CustomTextStyles.bodyLargeLibreBaskerville)),
                      SizedBox(height: 12.v),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_1_56k".tr,
                                        style: CustomTextStyles
                                            .titleSmallLatoLightblueA700),
                                    TextSpan(text: "  ".tr),
                                    TextSpan(
                                        text: "lbl_followers".tr,
                                        style: CustomTextStyles
                                            .bodyMediumLightblueA700)
                                  ]),
                                  textAlign: TextAlign.left)),
                          Padding(
                            padding: EdgeInsets.only(left: 24.h),
                            child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "lbl_21".tr,
                                        style: CustomTextStyles
                                            .titleSmallLatoLightblueA700),
                                    TextSpan(
                                        text: "lbl_following".tr,
                                        style: CustomTextStyles
                                            .bodyMediumLightblueA700)
                                  ],
                                ),
                                textAlign: TextAlign.left),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomRow(
                label: "lbl_location".tr,
                value: "lbl_nairobi".tr,
              ),
              CustomRow(
                label: "msg_favorite_art_styles".tr,
                value: "msg_surrealism_digital".tr,
              ),
              CustomRow(
                label: "lbl_influences".tr,
                value: "msg_salvador_dali_frida".tr,
              ),
            ],
          ),
          CustomElevatedButton(
              text: "lbl_edit_profile".tr,
              margin: EdgeInsets.only(left: 41.h, top: 22.v, right: 41.h),
              buttonTextStyle: CustomTextStyles.titleSmallLatoWhiteA700Medium,
              onTap: () {
                onTapEditprofile();
              },
              alignment: Alignment.center)
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }

  /// Navigates to the settingsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the settingsScreen.
  onTapProfileicons() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editProfileScreen.
  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }

  /// Navigates to the uploadArtworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the uploadArtworkScreen.
  onTapAddnew() {
    Get.toNamed(
      AppRoutes.uploadArtworkScreen,
    );
  }

  /// Navigates to the modalOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the modalOneScreen.
  onTapImgIconsone() {
    Get.toNamed(
      AppRoutes.modalOneScreen,
    );
  }

  /// Navigates to the createcollectionScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the createcollectionScreen.
  onTapCreate() {
    Get.toNamed(
      AppRoutes.createcollectionScreen,
    );
  }

  /// Navigates to the artCommunityEngagementScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artCommunityEngagementScreen.
  onTapImgArrowrightone() {
    Get.toNamed(
      AppRoutes.artCommunityEngagementScreen,
    );
  }
}
