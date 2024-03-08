import '../controller/art_community_engagement_controller.dart';
import '../models/engagementcard_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EngagementcardItemWidget extends StatelessWidget {
  EngagementcardItemWidget(
    this.engagementcardItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EngagementcardItemModel engagementcardItemModelObj;

  var controller = Get.find<ArtCommunityEngagementController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.h),
      decoration: AppDecoration.fillPrimaryOpacity2.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse140x40,
            height: 40.adaptSize,
            width: 40.adaptSize,
            radius: BorderRadius.circular(
              20.h,
            ),
            margin: EdgeInsets.only(bottom: 121.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "lbl_artinnovator".tr,
                        style: theme.textTheme.titleMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 84.h),
                        child: Text(
                          "lbl_3_hours_ago".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.v),
                  Row(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.v,
                          bottom: 5.v,
                        ),
                        child: Text(
                          "lbl_artwork".tr,
                          style: CustomTextStyles.titleMediumLatoOnBackground,
                        ),
                      ),
                      TextButton(
                        style: CustomButtonStyles.outlineTertiaryButton,
                        onPressed: () {},
                        child: Text(
                          "Enchanted Forest",
                        ),
                      ),
                     
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 11.v,
                      right: 23.h,
                    ),
                    child: Text(
                      "msg_this_is_a_masterpiece".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: CustomButtonStyles.outlineSecondaryButton,
                        onPressed: () {},
                        child: Text(
                          "Reply".tr,
                          style: CustomTextStyles.bodyMediumSecondary,
                        ),
                      ),
                      Container(
                        height: 33.v,
                        width: 35.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.h,
                          vertical: 8.v,
                        ),
                        decoration: AppDecoration.outlineSecondary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgLove,
                          height: 17.adaptSize,
                          width: 17.adaptSize,
                          alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
