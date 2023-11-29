import '../notifications_page/widgets/notificationcar_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/notificationcar_item_model.dart';
import 'models/notifications_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key})
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
          decoration: AppDecoration.fillWhiteA,
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
                separatorBuilder: (
                  context,
                  index,
                ) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 11.0.v),
                    child: SizedBox(
                      width: 358.h,
                      child: Divider(
                        height: 1.v,
                        thickness: 1.v,
                        color: appTheme.gray90033.withOpacity(0.08),
                      ),
                    ),
                  );
                },
                itemCount: controller.notificationsModelObj.value
                    .notificationcarItemList.value.length,
                itemBuilder: (context, index) {
                  NotificationcarItemModel model = controller
                      .notificationsModelObj
                      .value
                      .notificationcarItemList
                      .value[index];
                  return NotificationcarItemWidget(
                    model,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
