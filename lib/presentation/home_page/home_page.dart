import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_search_view.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../home_page/widgets/homeartcol_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'models/homeartcol_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';

import 'widgets/home_chip.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leadingWidth: 46.h,
          leading: CustomImageView(
              svgPath: ImageConstant.imgArtohmlogo,
              margin: EdgeInsets.only(
                left: 18.h,
              ),
              height: 40.v,
              width: 30.h),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(9.v, 9.v, 9.v, 9.v),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 32.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomSearchView()),
                      );
                    },
                    child: 
                    
                    CustomImageView(
                      svgPath: ImageConstant.imgSearchRed300,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.symmetric(
                        vertical: 8.v,
                      ),
                    ),
                  ),
                  SizedBox(width: 32.h),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        // padding: EdgeInsets.only(left: 32.h),
                        onPressed: () {
                          onTapImgNotification();
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: appTheme.red300,
                          size: 28,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: appTheme.red300,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                              height: 1,
                              fontFamily: 'lato',
                              decoration: TextDecoration.none,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame72,
                    height: 36.adaptSize,
                    width: 36.adaptSize,
                    margin: EdgeInsets.only(left: 32.h, right: 12.h),
                    onTap: () {
                      onTapImgProfileoneone();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
        body: bodyContent(),
      ),
    );
  }

  bodyContent() {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: [
          homeFilters(),
          SizedBox(height: 8.v),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 16.v),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    height: 400.v,
                    width: 340.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          // color: Colors.black.withOpacity(0.5),
                          color: appTheme.blueGray400.withOpacity(0.5),

                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.h),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgRectangle11400x3401,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.h, top: 18.v),
                  child: Obx(
                    () => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 26.v);
                      },
                      itemCount: controller
                          .homeModelObj.value.homeartcolItemList.value.length,
                      itemBuilder: (context, index) {
                        HomeartcolItemModel model = controller
                            .homeModelObj.value.homeartcolItemList.value[index];

                        return HomeartcolItemWidget(
                            homeartcolItemModelObj: model);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.v,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  homeFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 16.h, top: 16.v),
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: CustomDropDown(
                borderDecoration: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    )),
                dropdownColor: appTheme.lightBlueA700,
                width: 120.h,
                hintText: "Filter By",
                items: controller.homeModelObj.value.dropdownItemList!.value,
                onChanged: (value) {
                  controller.onSelected(value);
                },
              ),
            ),
            HomeChip(
              labelText: 'Art',
            ),
            HomeChip(
              labelText: 'Painting',
            ),
            HomeChip(
              labelText: 'Photography',
            ),
          ],
        ),
      ),
    );
  }

  /// Navigates to the notificationsTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the notificationsTabContainerScreen.
  onTapImgNotification() {
    Get.toNamed(
      AppRoutes.notificationsTabContainerScreen,
    );
  }

  /// Navigates to the userProfileContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the userProfileContainerScreen.
  onTapImgProfileoneone() {
    Get.toNamed(
      AppRoutes.userProfileContainerScreen,
    );
  }

  /// Navigates to the art_marketplace_screen when the action is triggered.

  onTapImgMarketplace() {
    Get.toNamed(
      AppRoutes.artMarketplaceScreen,
    );
  }
}
