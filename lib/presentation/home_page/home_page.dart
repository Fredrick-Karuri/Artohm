import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_search_view.dart';
import '../home_page/widgets/homeartcol_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'models/homeartcol_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
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
                      child: CustomImageView(
                          svgPath: ImageConstant.imgSearchRed300,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.symmetric(vertical: 8.v)),
                    ),
                    CustomImageView(
                        svgPath: ImageConstant.imgNotificationRed300,
                        height: 24.v,
                        width: 20.h,
                        margin:
                            EdgeInsets.only(left: 32.h, top: 8.v, bottom: 8.v),
                        onTap: () {
                          onTapImgNotification();
                        }),
                    SizedBox(width: 32.h),
                    CustomImageView(
                        imagePath: ImageConstant.imgFrame72,
                        height: 36.adaptSize,
                        width: 36.adaptSize,
                        margin: EdgeInsets.only(left: 32.h, right: 12.h),
                        onTap: () {
                          onTapImgProfileoneone();
                        })
                  ]),
            ),
          ],
        ),
        body: bodyContent(),
        
      ),
    );
  }

  Container bodyContent() {
    return Container(
        width: double.maxFinite,
        // decoration: AppDecoration.fillWhiteA,
        // decoration: AppDecoration.outlineBlack900012,
        child: ListView(
          // child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16.h, top: 24.v),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDropDown(
                      width: 120.h,
                      icon: Container(
                        margin: EdgeInsets.fromLTRB(16.h, 12.v, 16.h, 11.v),
                      ),
                      hintText: "Filter By",
                      items: controller
                          .homeModelObj.value.dropdownItemList!.value,
                      onChanged: (value) {
                        controller.onSelected(value);
                      },
                    ),
                    CustomElevatedButton(
                        width: 120.h,
                        text: "lbl_painting".tr,
                        margin: EdgeInsets.only(left: 8.h),
                        buttonStyle: CustomButtonStyles.outlineLightBlueATL15,
                        buttonTextStyle: theme.textTheme.labelLarge!),
                    CustomElevatedButton(
                        width: 61.h,
                        text: "lbl_art".tr,
                        margin: EdgeInsets.only(left: 8.h),
                        buttonStyle: CustomButtonStyles.outlineLightBlueATL15,
                        buttonTextStyle: theme.textTheme.labelLarge!),
                    CustomElevatedButton(
                        width: 122.h,
                        decoration: BoxDecoration(
                            color: appTheme.lightBlueA700.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(16.h)),
                        text: "lbl_photography2".tr,
                        margin: EdgeInsets.only(left: 8.h),
                        buttonStyle: CustomButtonStyles.fillLightBlueATL15,
                        buttonTextStyle: theme.textTheme.labelLarge!),
                  ],
                ),
              ),
            ),
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
        
                    return HomeartcolItemWidget(model);
                  },
                ),
              ),
            ),
            SizedBox(height: 24.v),

          ],
          // ),
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
                                    // Container(
                                    //     width: 112.h,
                                    //     padding:
                                    //         EdgeInsets.symmetric(vertical: 7.v),
                                    //     decoration: AppDecoration.fillLightBlueA
                                    //         .copyWith(
                                    //             borderRadius: BorderRadiusStyle
                                    //                 .circleBorder15),
                                    //     child: Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.end,
                                    //         crossAxisAlignment:
                                    //             CrossAxisAlignment.end,
                                    //         children: [
                                    //           Padding(
                                    //               padding:
                                    //                   EdgeInsets.only(top: 2.v),
                                    //               child: Text(
                                    //                   "lbl_filter_by".tr,
                                    //                   style: theme.textTheme
                                    //                       .labelLarge)),
                                    //           // CustomImageView(
                                    //           //     svgPath: ImageConstant
                                    //           //         .imgArrowdown,
                                    //           //     height: 6.v,
                                    //           //     width: 12.h,
                                    //           //     margin: EdgeInsets.only(
                                    //           //         left: 7.h,
                                    //           //         top: 6.v,
                                    //           //         bottom: 4.v)),
                                    //         ])),

                                    // CustomDropDown(
                                    //   // fillColor: Colors.blue,

                                    // ),

                                    // CustomDropDown(
                                    //         width: 160.h,
                                    //         icon: Container(
                                    //             margin: EdgeInsets.fromLTRB(
                                    //                 30.h, 12.v, 16.h, 11.v),
                                    //             child: CustomImageView(
                                    //                 svgPath: ImageConstant
                                    //                     .imgProfileiconsRed30012x18)),
                                    //         hintText: "lbl_surrealism".tr,
                                    //         hintStyle: CustomTextStyles
                                    //             DropDownStyleHelper,
                                    //         onChanged: (value) {
                                    //         }),
