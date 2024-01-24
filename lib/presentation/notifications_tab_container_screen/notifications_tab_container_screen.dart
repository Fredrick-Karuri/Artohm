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
          SizedBox(height: 8.v),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("lbl_filter_by_type".tr,
                    style: CustomTextStyles.bodyLargeLibreBaskerville),
              ),
          Container(
            // height: 36.v,
            // width: 360.h,
            margin: EdgeInsets.only( top: 14.v),
            child: TabBar(
              tabAlignment: TabAlignment.start ,
              controller: controller.tabviewController,
              isScrollable: true,
              labelColor: appTheme.whiteA700,
              labelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400),
              unselectedLabelColor: appTheme.lightBlueA700,
              unselectedLabelStyle: TextStyle(
                  fontSize: 16.fSize,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400),
              indicatorPadding: EdgeInsets.all(0.5.h),
              indicator: BoxDecoration(
                  color: appTheme.lightBlueA700,
                  borderRadius: BorderRadius.circular(17.h)),
              tabs: [
                Tab(
                    child: Text("lbl_all".tr)),
                Tab(
                    child: Text("lbl_comments".tr)),
                Tab(
                    child: Text("lbl_follows".tr)),
                Tab(
                    child: Text("lbl_likes".tr)),
              ],
            ),
          ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: 833.v,
              child: TabBarView(
                controller: controller.tabviewController,
                children: [
                  NotificationsPage(),
                  NotificationsPage(),
                  NotificationsPage(),
                  NotificationsPage()
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
