import 'dart:io';

import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/artworks/widgets/favorite_artworks_view.dart';
import 'package:artohmapp/presentation/upload_artwork_confirmation_screen/widgets/custom_row.dart';
import 'package:artohmapp/presentation/upload_artwork_screen/controller/upload_artwork_controller.dart';
import 'package:artohmapp/presentation/profile_container_screen/controller/user_profile_container_controller.dart';
import 'package:artohmapp/presentation/profile_container_screen/widgets/collection_list_screen.dart';
import '../../widgets/custom_appbar_component.dart';
import 'widgets/collection_item_widget.dart';
import 'widgets/enchantedforest_item_widget.dart';
import 'models/collection_item_model.dart';
import 'models/enchantedforest_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class UserProfileContainerScreen
    extends GetWidget<UserProfileContainerController> {
  final FavoriteArtworksController favoriteArtworksController;

  const UserProfileContainerScreen(this.favoriteArtworksController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionsController collectionsController = Get.find();

    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      top: false,
      child: Container(
        color: Get.theme.scaffoldBackgroundColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBarComponent(
            onBackPressed: () {
              Get.back();
            },
            title: "lbl_profile".tr,
            hasTrailingIcon: true,
            onTapTrailingIcon: () {
              onTapProfileicons();
            },
          ),
          body: SizedBox(
            width: mediaQueryData.size.width,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 24.v, bottom: 32.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileInfoCard(),
                  FavoriteArtworksView(),
                  yourWork(),
                  CollectionListWidget(
                      collections: collectionsController.collections),
                  buildCollectionsWidget(),
                  communityEngagement(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // liked artworks page
  likedArtworks() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "liked artworks",
                style: theme.textTheme.titleMedium,
              ),
              Text("20"),
            ],
          ),
          Container(
            height: 200, // Adjust this value as needed
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.v, right: 2.h),
                    child: Obx(
                      () => ListView.builder(
                        scrollDirection: Axis.horizontal,
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
                ),
                Container(
                  width: 100,
                  height: 100, // Adjust this value to match the image size
                  child: CustomOutlinedButton(
                    onTap: () {},
                    text: "See All",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildCollectionsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "lbl_collections".tr,
            style: theme.textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 17.v),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: buildCollectionList(),
        ),
      ],
    );
  }

  buildCollectionList() {
    return Align(
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: 200.v,
              child: Obx(
                () => ListView.separated(
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
    );
  }

  communityEngagement() {
    return Container(
      margin: EdgeInsets.only(left: 16.h, right: 16.h, top: 32.v),
      padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 4.v),
      decoration: AppDecoration.outlineTertiary
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.h),
                color: theme.colorScheme.surface,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.h,
                vertical: 12.v,
              ),
              child: Row(
                children: [
                  Text("msg_art_community_engagement".tr,
                      style: theme.textTheme.titleMedium),
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowrightRed300,
                    height: 18.v,
                    width: 10.h,
                    margin: EdgeInsets.only(left: 69.h, bottom: 2.v),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("lbl_recent_comments".tr,
                    style: theme.textTheme.bodyLarge),
                Padding(
                  padding: EdgeInsets.only(left: 4.h, top: 11.v),
                  child: Text(
                    "msg_beautiful_use_of".tr,
                    style: CustomTextStyles.bodyMedium,
                  ),
                ),
                Container(
                  width: 289.h,
                  margin: EdgeInsets.only(left: 4.h, top: 7.v, right: 48.h),
                  child: Text(
                    "msg_your_creations".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMedium,
                  ),
                ),
                Container(
                  width: 289.h,
                  margin: EdgeInsets.only(left: 4.h, top: 7.v, right: 48.h),
                  child: Text(
                    "msg_your_creations".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  yourWork() {
    UploadArtworkController uploadArtworkController = Get.find();

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 32.v, bottom: 32.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.v, bottom: 7.v),
                child: Text("lbl_your_work".tr,
                    style: theme.textTheme.titleMedium),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.h,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: theme.colorScheme.secondary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
                onPressed: () {
                  Get.toNamed(
                    AppRoutes.yourArtworksPage,
                  );
                },
                child: Text(
                  '121 Artworks',
                  style: CustomTextStyles.titleSmallLatoSecondaryMedium,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16.v,
            ),
            child: Obx(
              () => GridView.builder(
                itemCount: uploadArtworkController.yourWorks.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Artwork artwork = uploadArtworkController.yourWorks[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ArtworkScreen(),
                          arguments: artwork, binding: ArtworkBinding());
                    },
                    child: Image.file(
                      File(artwork.imageUrl),
                    ),
                  );
                },
              ),
            ),

            // Obx(
            //   () => GridView.builder(
            //     shrinkWrap: true,
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         mainAxisExtent: 172.v,
            //         crossAxisCount: 3,
            //         mainAxisSpacing: 13.h,
            //         crossAxisSpacing: 13.h),
            //     physics: NeverScrollableScrollPhysics(),
            //     itemCount: controller.userProfileContainerModelObj.value
            //         .enchantedforestItemList.value.length,
            //     itemBuilder: (context, index) {
            //       EnchantedforestItemModel model = controller
            //           .userProfileContainerModelObj
            //           .value
            //           .enchantedforestItemList
            //           .value[index];
            //       return EnchantedforestItemWidget(model);
            //     },
            //   ),
            // ),
          ),
          CustomOutlinedButton(
            buttonStyle: CustomButtonStyles.outlinePrimaryButton,
            text: "lbl_add_new".tr,
            margin: EdgeInsets.only(
              top: 24.v,
            ),
            onTap: () {
              onTapAddnew();
            },
          ),
        ],
      ),
    );
  }

  profileInfoCard() {
    return Container(
      margin: EdgeInsets.only(right: 16.h, bottom: 24.v, left: 16),
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 16.v),
      decoration: AppDecoration.outlineBlack
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
                                            .titleSmallLatoSecondary),
                                    TextSpan(text: "  ".tr),
                                    TextSpan(
                                        text: "lbl_followers".tr,
                                        style: CustomTextStyles
                                            .bodyMediumSecondary)
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
                                            .titleSmallLatoSecondary),
                                    TextSpan(
                                        text: "lbl_following".tr,
                                        style: CustomTextStyles
                                            .bodyMediumSecondary)
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
          Padding(
            padding: EdgeInsets.only(left: 16.h, top: 24.v),
            child: Column(
              children: [
                CustomRowWidget(
                  title: 'lbl_location'.tr,
                  text: 'lbl_nairobi'.tr,
                ),
                CustomRowWidget(
                  title: 'msg_favorite_art_styles'.tr,
                  text: 'msg_surrealism_digital'.tr,
                ),
                CustomRowWidget(
                  title: 'lbl_influences'.tr,
                  text: 'msg_salvador_dali_frida'.tr,
                ),
              ],
            ),
          ),
          CustomElevatedButton(
              buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
              text: "lbl_edit_profile".tr,
              margin: EdgeInsets.only(left: 16.h, top: 22.v, right: 16.h),
              buttonTextStyle: CustomTextStyles.buttonTextSmall,
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

  /// Navigates to the artCommunityEngagementScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artCommunityEngagementScreen.
  onTapImgArrowrightone() {
    Get.toNamed(
      AppRoutes.artCommunityEngagementScreen,
    );
  }
}
