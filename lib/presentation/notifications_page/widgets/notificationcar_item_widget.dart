import '../controller/notifications_controller.dart';
import '../models/notificationcar_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationcarItemWidget extends StatelessWidget {
  NotificationcarItemWidget(
    this.notificationcarItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  NotificationcarItemModel notificationcarItemModelObj;

  var controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse140x40,
          height: 40.adaptSize,
          width: 40.adaptSize,
          radius: BorderRadius.circular(
            20.h,
          ),
          margin: EdgeInsets.only(bottom: 94.v),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    notificationcarItemModelObj.userName!.value,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 12.v),
                Obx(
                  () => Text(
                    notificationcarItemModelObj.notificationTex!.value,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleMediumLatoBlack90001,
                  ),
                ),
                SizedBox(height: 12.v),
                Obx(
                  () => Text(
                    notificationcarItemModelObj.notificationTim!.value,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumBlack90001,
                  ),
                ),
                SizedBox(height: 10.v),
                Obx(
                  () => Text(
                    notificationcarItemModelObj.notificationCom!.value,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumBlack90001_3.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
