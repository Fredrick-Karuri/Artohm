import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter/widgets.dart';

class NavigationObserver extends RouteObserver<PageRoute<dynamic>> {
  final CustomBottomBarController controller = Get.find();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    updateCurrentPage(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    updateCurrentPage(previousRoute);
  }

  void updateCurrentPage(Route<dynamic>? route) {
    if (route != null && route.settings.name != null) {
      final currentRoute = route.settings.name;
      switch (currentRoute) {
        case AppRoutes.homePage:
          controller.currentPage.value = BottomBarEnum.Home2;
          break;
        case AppRoutes.artMarketplaceScreen:
          controller.currentPage.value = BottomBarEnum.Marketplace2;
          break;
        case AppRoutes.artCommunityScreen:
          controller.currentPage.value = BottomBarEnum.Community2;
          break;
        case AppRoutes.collaborateScreen:
          controller.currentPage.value = BottomBarEnum.Collaborate;
          break;
        default:
          controller.currentPage.value = BottomBarEnum.Home2;
          break;
      }
    }
  }
}
