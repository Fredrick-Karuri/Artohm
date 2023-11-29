import 'package:artohmapp/presentation/art_community_engagement_screen/widgets/engagement_chip.dart';

import '../art_community_engagement_screen/widgets/engagementcard_item_widget.dart';
import 'controller/art_community_engagement_controller.dart';
import 'models/engagementcard_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class ArtCommunityEngagementScreen
    extends GetWidget<ArtCommunityEngagementController> {
  const ArtCommunityEngagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            leadingWidth: 46.h,
            leading: AppbarImage(
              svgPath: ImageConstant.imgArrowleftRed300,
              margin: EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
              onTap: () {
                onTapArrowleftone();
              },
            ),
            title: AppbarSubtitle(
              text: "lbl_engagement".tr,
              margin: EdgeInsets.only(left: 36.h, top: 43.v, bottom: 16.v),
            ),
            actions: [
              AppbarImage1(
                svgPath: ImageConstant.imgMask,
                margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v),
              )
            ],
            styleType: Style.bgFill),
        body: bodyContent(),
      ),
    );
  }

  bodyContent() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20.h),
            child: topChips(),
          ),
          // SizedBox(height: 32.v),
          engagementCard(),
        ],
      ),
    );
  }

  topChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
                svgPath: ImageConstant.imgProfileiconsLightBlueA700,
                labelText: "lbl_200".tr),
            CustomContainer(
                svgPath: ImageConstant.imgLove, labelText: "lbl_700".tr),
            CustomContainer(
                svgPath: ImageConstant.imgShare, labelText: "lbl_200".tr),
          ],
        ),
      ),
    );
  }

  engagementCard() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Obx(
          () => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.v);
            },
            itemCount: controller.artCommunityEngagementModelObj.value
                .engagementcardItemList.value.length,
            itemBuilder: (context, index) {
              EngagementcardItemModel model = controller
                  .artCommunityEngagementModelObj
                  .value
                  .engagementcardItemList
                  .value[index];
              return EngagementcardItemWidget(model);
            },
          ),
        ),
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
}

            // Flexible(
            //   fit: FlexFit.loose,
            //   child: CustomSearchView(
            //     width: 99.h,
            //     margin: EdgeInsets.only(left: 8.h),
            //     controller: controller.searchController,
            //     hintText: "lbl_700".tr,
            //     prefix: Container(
            //         margin: EdgeInsets.fromLTRB(20.h, 16.v, 10.h, 16.v),
            //         child: CustomImageView(svgPath: ImageConstant.imgSearch)),
            //     prefixConstraints: BoxConstraints(maxHeight: 56.v),
            //     suffix: Padding(
            //       padding: EdgeInsets.only(right: 15.h),
            //       child: IconButton(
            //         onPressed: () {
            //           controller.searchController.clear();
            //         },
            //         icon: Icon(Icons.clear, color: Colors.grey.shade600),
            //       ),
            //     ),
            //   ),
            // ),