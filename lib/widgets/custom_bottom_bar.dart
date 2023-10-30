import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavhomeRed300,
      activeIcon: ImageConstant.imgNavhomeRed300,
      title: "lbl_home2".tr,
      type: BottomBarEnum.Home2,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavmarketplace,
      activeIcon: ImageConstant.imgNavmarketplace,
      title: "lbl_marketplace2".tr,
      type: BottomBarEnum.Marketplace2,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavcommunity,
      activeIcon: ImageConstant.imgNavcommunity,
      title: "lbl_community2".tr,
      type: BottomBarEnum.Community2,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavcollaborate,
      activeIcon: ImageConstant.imgNavcollaborate,
      title: "lbl_collaborate".tr,
      type: BottomBarEnum.Collaborate,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        border: Border(
          top: BorderSide(
            color: appTheme.black90001.withOpacity(0.08),
            width: 1.h,
          ),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].icon,
                    height: 24.v,
                    width: 23.h,
                    color: theme.colorScheme.primaryContainer,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: appTheme.black90001,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].activeIcon,
                    height: 24.v,
                    width: 23.h,
                    color: appTheme.red300,
                  ),
                  Text(
                    bottomMenuList[index].title ?? "",
                    style: CustomTextStyles.bodySmallRed300.copyWith(
                      color: appTheme.red300,
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged?.call(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home2,
  Marketplace2,
  Community2,
  Collaborate,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

// class DefaultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(10),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Please replace the respective Widget here',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
