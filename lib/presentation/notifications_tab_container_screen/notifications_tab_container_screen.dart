import 'package:artohmapp/presentation/notifications_page/models/notification_card_item_model.dart';

import '../../widgets/custom_appbar_component.dart';
import 'controller/notifications_tab_container_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/notifications_page/notifications_page.dart';
import 'package:flutter/material.dart';

class NotificationsTabContainerScreen
    extends GetWidget<NotificationsTabContainerController> {
  const NotificationsTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "lbl_notifications".tr,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: bodyContent(),
      ),
    );
  }

  bodyContent() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 14.v),
            child: TabBar(
              tabAlignment: TabAlignment.start,
              controller: controller.tabviewController,
              isScrollable: true,
              labelColor: appTheme.whiteA700,
              labelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400),
              unselectedLabelColor: theme.colorScheme.secondary,
              unselectedLabelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400),
              indicatorPadding: EdgeInsets.all(0.5.h),
              indicator: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(17.h)),
              tabs: [
                Tab(child: Text("lbl_all".tr)),
                Tab(child: Text("lbl_comments".tr)),
                Tab(child: Text("lbl_follows".tr)),
                Tab(child: Text("lbl_likes".tr)),
                Tab(child: Text("mentions")),  
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 833.v,
              child: TabBarView(
                controller: controller.tabviewController,
                children: [
                  NotificationsPage(
                    type: null,
                  ),
                  NotificationsPage(
                    type: NotificationType.comment,
                  ),
                  NotificationsPage(
                    type: NotificationType.follow,
                  ),
                  NotificationsPage(
                    type: NotificationType.like,
                  ),
                  NotificationsPage(
                    type: NotificationType.mention,
                  ),

                ],
              ),
            ),
          ),
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
}
