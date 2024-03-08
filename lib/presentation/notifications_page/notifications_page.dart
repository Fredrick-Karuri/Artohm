import 'widgets/notification_card_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notification_card_item_model.dart';
import 'models/notifications_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final NotificationType? type;

  NotificationsPage({Key? key, this.type})
      : super(
          key: key,
        );

  NotificationsController controller =
      Get.put(NotificationsController(NotificationsModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          // decoration: AppDecoration.fillBackground,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.h,
              top: 16.v,
              right: 16.h,
            ),
            child: Obx(
              () => ListView.separated(
  physics: BouncingScrollPhysics(),
  shrinkWrap: true,
  separatorBuilder: (context, index) => Container(),
  itemCount: controller.notificationsModelObj.value
      .notificationCardItemList.value.length,
  itemBuilder: (context, index) {
    NotificationCardItemModel model = controller
        .notificationsModelObj
        .value
        .notificationCardItemList
        .value[index];
    if (type == null || model.type!.value == type) {
      return NotificationCardItemWidget(
        notificationCardItemModelObj: model,
      );
    } else {
      return Container();
    }
  },
),

            ),
          ),
        ),
      ),
    );
  }
}
