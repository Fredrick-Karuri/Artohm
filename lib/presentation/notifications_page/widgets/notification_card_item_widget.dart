import '../controller/notifications_controller.dart';
import '../models/notification_card_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotificationCardItemWidget extends StatelessWidget {
  final NotificationCardItemModel notificationCardItemModelObj;

  NotificationCardItemWidget({
    Key? key,
    required this.notificationCardItemModelObj,
  }) : super(key: key);

  final controller = Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse140x40,
              height: 40.adaptSize,
              width: 40.adaptSize,
              radius: BorderRadius.circular(20.h),
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
                        notificationCardItemModelObj.userName!.value,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Obx(
                      () => Text(
                        notificationCardItemModelObj.notificationText!.value,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleMediumLatoBlack90001,
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Obx(
                      () => Text(
                        notificationCardItemModelObj.notificationTime!.value,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMediumBlack90001,
                      ),
                    ),
                    SizedBox(height: 10.v),
                    if (notificationCardItemModelObj.notificationComment !=
                        null)
                      Obx(
                        () => Text(
                          notificationCardItemModelObj
                              .notificationComment!.value,
                          overflow: TextOverflow.ellipsis,
                          style:
                              CustomTextStyles.bodyMediumBlack90001_3.copyWith(
                            height: 1.50,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
         Padding(
              padding: EdgeInsets.symmetric(vertical: 11.0.v),
              child: SizedBox(
                // width: 358.h,
                child: Divider(
                  height: 1.v,
                  thickness: 1.v,
                  color: appTheme.gray90033.withOpacity(0.08),
                ),
              ),
            ),
      ],
    );
  }
}
