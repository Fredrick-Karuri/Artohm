import '../../widgets/custom_appbar_component.dart';
import 'controller/notifications_tab_container_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/notifications_page/notifications_page.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_title.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NotificationsTabContainerScreen
    extends GetWidget<NotificationsTabContainerController> {
  const NotificationsTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(title: "lbl_notifications".tr),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 25.v),
                  child: Text("lbl_filter_by_type".tr,
                      style: CustomTextStyles.bodyLargeLibreBaskerville)),
              Container(
                height: 36.v,
                width: 360.h,
                margin: EdgeInsets.only(left: 8.h, top: 14.v),
                child: TabBar(
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
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0), // Adjust the padding as needed
                      child: Text("lbl_all".tr),
                    )),
                    Tab(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0), // Adjust the padding as needed
                      child: Text("lbl_comments".tr),
                    )),
                    Tab(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0), // Adjust the padding as needed
                      child: Text("lbl_follows".tr),
                    )),
                    Tab(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0), // Adjust the padding as needed
                      child: Text("lbl_likes".tr),
                    )),
                  ],
                ),
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
