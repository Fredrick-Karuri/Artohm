import '../controller/art_community_controller.dart';
import '../models/userprofile_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<ArtCommunityController>();

  @override
  Widget build(BuildContext context) {
    return Row(
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
          margin: EdgeInsets.only(bottom: 37.v),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  userprofileItemModelObj.userName!.value,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 13.v),
              Obx(
                () => Text(
                  userprofileItemModelObj.userBio!.value,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallLatoBlack90001,
                ),
              ),
              SizedBox(height: 12.v),
              Opacity(
                opacity: 0.64,
                child: Obx(
                  () => Text(
                    userprofileItemModelObj.userDescription!.value,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumBlack90001_1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
