import '../art_community_engagement_screen/widgets/engagementcard_item_widget.dart';
import 'controller/art_community_engagement_controller.dart';
import 'models/engagementcard_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/appbar_subtitle.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class ArtCommunityEngagementScreen
    extends GetWidget<ArtCommunityEngagementController> {
  const ArtCommunityEngagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 46.h,
                leading: AppbarImage(
                    svgPath: ImageConstant.imgArrowleftRed300,
                    margin:
                        EdgeInsets.only(left: 18.h, top: 38.v, bottom: 14.v),
                    onTap: () {
                      onTapArrowleftone();
                    }),
                title: AppbarSubtitle(
                    text: "lbl_engagement".tr,
                    margin:
                        EdgeInsets.only(left: 36.h, top: 43.v, bottom: 16.v)),
                actions: [
                  AppbarImage1(
                      svgPath: ImageConstant.imgMask,
                      margin: EdgeInsets.fromLTRB(9.h, 7.v, 9.h, 63.v))
                ],
                styleType: Style.bgFill),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 45.h),
                          child: Row(children: [
                            Container(
                                width: 99.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 16.v),
                                decoration: AppDecoration.outlineLightblueA700
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder20),
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant
                                          .imgProfileiconsLightBlueA700,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.h, top: 3.v, bottom: 3.v),
                                      child: Text("lbl_200".tr,
                                          style: CustomTextStyles
                                              .titleSmallLatoLightblueA700Medium))
                                ])),
                            Container(
                                width: 99.h,
                                margin: EdgeInsets.only(left: 8.h),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 16.v),
                                decoration: AppDecoration.outlineLightblueA700
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder20),
                                child: Row(children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLove,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.h, top: 3.v, bottom: 3.v),
                                      child: Text("lbl_700".tr,
                                          style: CustomTextStyles
                                              .titleSmallLatoLightblueA700Medium))
                                ])),
                            CustomSearchView(
                                width: 99.h,
                                margin: EdgeInsets.only(left: 8.h),
                                controller: controller.searchController,
                                hintText: "lbl_700".tr,
                                prefix: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        20.h, 16.v, 10.h, 16.v),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgSearch)),
                                prefixConstraints:
                                    BoxConstraints(maxHeight: 56.v),
                                suffix: Padding(
                                    padding: EdgeInsets.only(right: 15.h),
                                    child: IconButton(
                                        onPressed: () {
                                          controller.searchController.clear();
                                        },
                                        icon: Icon(Icons.clear,
                                            color: Colors.grey.shade600))))
                          ])),
                      SizedBox(height: 32.v),
                      Expanded(
                          child: Obx(() => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16.v);
                              },
                              itemCount: controller
                                  .artCommunityEngagementModelObj
                                  .value
                                  .engagementcardItemList
                                  .value
                                  .length,
                              itemBuilder: (context, index) {
                                EngagementcardItemModel model = controller
                                    .artCommunityEngagementModelObj
                                    .value
                                    .engagementcardItemList
                                    .value[index];
                                return EngagementcardItemWidget(model);
                              })))
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
  }
}
