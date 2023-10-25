import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/notifications_tab_container_screen/models/notifications_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the NotificationsTabContainerScreen.
///
/// This class manages the state of the NotificationsTabContainerScreen, including the
/// current notificationsTabContainerModelObj
class NotificationsTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<NotificationsTabContainerModel> notificationsTabContainerModelObj =
      NotificationsTabContainerModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 4));
}
