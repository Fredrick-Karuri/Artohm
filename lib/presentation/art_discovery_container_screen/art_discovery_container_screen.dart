import 'controller/art_discovery_container_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/home_page/home_page.dart';
import 'package:artohmapp/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/art_marketplace_screen.dart';
import 'package:artohmapp/presentation/collaborate_screen/collaborate_screen.dart';
import 'package:artohmapp/presentation/art_community_screen/art_community_screen.dart';


class ArtDiscoveryContainerScreen
    extends GetWidget<ArtDiscoveryContainerController> {
  const ArtDiscoveryContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.homePage,
                onGenerateRoute: (routeSetting) => GetPageRoute(
                    page: () => getCurrentPage(routeSetting.name!),
                    transition: Transition.noTransition)),
            bottomNavigationBar:
                CustomBottomBar(onChanged: (BottomBarEnum type) {
              Get.toNamed(getCurrentRoute(type), id: 1);
            })));
  }

  ///Handling route based on bottom click actions

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home2:
        return AppRoutes.homePage;
      case BottomBarEnum.Marketplace2:
        return AppRoutes.artMarketplaceScreen;
      case BottomBarEnum.Community2:
        return AppRoutes.artCommunityScreen;
      case BottomBarEnum.Collaborate:
        return AppRoutes.collaborateScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
    case AppRoutes.homePage:
      return HomePage();
    case AppRoutes.artMarketplaceScreen:
      return ArtMarketplaceScreen();
    case AppRoutes.artCommunityScreen:
      return ArtCommunityScreen();
    case AppRoutes.collaborateScreen:
      return CollaborateScreen();
    default:
      return HomePage();
  }
}
}
