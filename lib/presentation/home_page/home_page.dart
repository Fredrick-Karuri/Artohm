import '../home_page/widgets/homeartcol_item_widget.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';
import 'models/homeartcol_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 7.v),
                              decoration: AppDecoration.outlineBlack900012,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgMask,
                                        height: 10.v,
                                        width: 49.h,
                                        alignment: Alignment.centerRight),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            24.h, 15.v, 24.h, 1.v),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArtohmlogo,
                                                  height: 40.v,
                                                  width: 30.h),
                                              Spacer(),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgSearchRed300,
                                                  height: 24.adaptSize,
                                                  width: 24.adaptSize,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8.v)),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgNotificationRed300,
                                                  height: 24.v,
                                                  width: 20.h,
                                                  margin: EdgeInsets.only(
                                                      left: 32.h,
                                                      top: 8.v,
                                                      bottom: 8.v),
                                                  onTap: () {
                                                    onTapImgNotification();
                                                  }),
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgFrame72,
                                                  height: 36.adaptSize,
                                                  width: 36.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      left: 32.h),
                                                  onTap: () {
                                                    onTapImgProfileoneone();
                                                  })
                                            ]))
                                  ])),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(left: 16.h, top: 24.v),
                              child: IntrinsicWidth(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Container(
                                        width: 113.h,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 7.v),
                                        decoration: AppDecoration.fillLightBlueA
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .circleBorder15),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 2.v),
                                                  child: Text(
                                                      "lbl_filter_by".tr,
                                                      style: theme.textTheme
                                                          .labelLarge)),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowdown,
                                                  height: 6.v,
                                                  width: 12.h,
                                                  margin: EdgeInsets.only(
                                                      left: 7.h,
                                                      top: 6.v,
                                                      bottom: 4.v)),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 2.v),
                                                  child: Text("lbl_painting".tr,
                                                      style: theme.textTheme
                                                          .labelLarge))
                                            ])),
                                    CustomElevatedButton(
                                        width: 61.h,
                                        text: "lbl_art".tr,
                                        margin: EdgeInsets.only(left: 8.h),
                                        buttonStyle: CustomButtonStyles
                                            .fillLightBlueATL16,
                                        buttonTextStyle:
                                            theme.textTheme.labelLarge!),
                                    CustomElevatedButton(
                                        width: 122.h,
                                        text: "lbl_photography2".tr,
                                        margin: EdgeInsets.only(left: 8.h),
                                        buttonStyle: CustomButtonStyles
                                            .fillLightBlueATL16,
                                        buttonTextStyle:
                                            theme.textTheme.labelLarge!),
                                    Container(
                                        height: 33.v,
                                        width: 94.h,
                                        margin: EdgeInsets.only(left: 8.h),
                                        decoration: BoxDecoration(
                                            color: appTheme.lightBlueA700
                                                .withOpacity(0.08),
                                            borderRadius:
                                                BorderRadius.circular(16.h)))
                                  ]))),
                          SizedBox(height: 16.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgRectangle11400x3401,
                              height: 400.v,
                              width: 340.h,
                              radius: BorderRadius.circular(8.h)),
                          Padding(
                              padding: EdgeInsets.only(left: 15.h, top: 18.v),
                              child: Obx(() => ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 26.v);
                                  },
                                  itemCount: controller.homeModelObj.value
                                      .homeartcolItemList.value.length,
                                  itemBuilder: (context, index) {
                                    HomeartcolItemModel model = controller
                                        .homeModelObj
                                        .value
                                        .homeartcolItemList
                                        .value[index];
                                    return HomeartcolItemWidget(model);
                                  })))
                        ]))))));
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
}
