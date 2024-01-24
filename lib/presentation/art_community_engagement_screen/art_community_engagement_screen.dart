import 'package:artohmapp/presentation/art_community_engagement_screen/widgets/engagement_chip.dart';
import 'package:artohmapp/widgets/custom_appbar_component.dart';

import '../art_community_engagement_screen/widgets/engagementcard_item_widget.dart';
import 'controller/art_community_engagement_controller.dart';
import 'models/engagementcard_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
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
        appBar: CustomAppBarComponent(title: "lbl_engagement".tr, onBackPressed: (){Get.back();},),
        body: bodyContent(),
      ),
    );
  }

  bodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topChips(),
        Expanded(
          child: engagementCard(),
        )
        // SizedBox(height: 32.v),
        // engagementCard(),
      ],
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
    return Padding(
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
