import '../controller/home_controller.dart';
import '../models/homeartcol_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeartcolItemWidget extends StatelessWidget {
  HomeartcolItemWidget(
    this.homeartcolItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomeartcolItemModel homeartcolItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            homeartcolItemModelObj.aiArtPushingTex!.value,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 15.v),
        Container(
          height: 200.v,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200.v,
                  width: 160.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle11200x1601,
                        height: 200.v,
                        width: 160.h,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 20.v,
                        width: 4.h,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(
                          right: 18.h,
                          bottom: 10.v,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200.v,
                  width: 160.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle11200x1602,
                        height: 200.v,
                        width: 160.h,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 20.v,
                        width: 4.h,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(
                          right: 18.h,
                          bottom: 10.v,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

                 Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                  height: 200.v,
                  width: 160.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle11200x1603,
                        height: 200.v,
                        width: 160.h,
                        radius: BorderRadius.circular(
                          8.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 20.v,
                        width: 4.h,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(
                          right: 18.h,
                          bottom: 10.v,
                        ),
                      ),
                    ],
                  ),
                ),
              )

              // SizedBox(
              //   height: 200.v,
              //   width: 160.h,
              //   child: Stack(
              //     alignment: Alignment.bottomRight,
              //     children: [
              //       CustomImageView(
              //         imagePath: ImageConstant.imgRectangle11200x1601,
              //         height: 200.v,
              //         width: 160.h,
              //         radius: BorderRadius.circular(
              //           8.h,
              //         ),
              //         alignment: Alignment.center,
              //       ),
              //       CustomImageView(
              //         svgPath: ImageConstant.imgIconsWhiteA700,
              //         height: 20.v,
              //         width: 4.h,
              //         alignment: Alignment.bottomRight,
              //         margin: EdgeInsets.only(
              //           right: 18.h,
              //           bottom: 10.v,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: 200.v,
              //   width: 160.h,
              //   margin: EdgeInsets.only(left: 16.h),
              //   child: Stack(
              //     alignment: Alignment.centerRight,
              //     children: [
              //       CustomImageView(
              //         imagePath: ImageConstant.imgRectangle11200x1602,
              //         height: 200.v,
              //         width: 160.h,
              //         radius: BorderRadius.circular(
              //           8.h,
              //         ),
              //         alignment: Alignment.center,
              //       ),

              //       // Align(
              //       //   alignment: Alignment.centerRight,
              //       //   child: Row(
              //       //     mainAxisAlignment: MainAxisAlignment.center,
              //       //     mainAxisSize: MainAxisSize.min,
              //       //     children: [
              //       //       CustomImageView(
              //       //         svgPath: ImageConstant.imgIconsWhiteA700,
              //       //         height: 20.v,
              //       //         width: 4.h,
              //       //         margin: EdgeInsets.only(
              //       //           top: 170.v,
              //       //           bottom: 10.v,
              //       //         ),
              //       //       ),
              //       //       CustomImageView(
              //       //         imagePath: ImageConstant.imgRectangle11200x1603,
              //       //         height: 200.v,
              //       //         width: 160.h,
              //       //         radius: BorderRadius.circular(
              //       //           8.h,
              //       //         ),
              //       //         margin: EdgeInsets.only(left: 34.h),
              //       //       ),
              //       //     ],
              //       //   ),
              //       // ),
              //     ],
              //   ),

              // ),
            ],
          ),
        ),
      ],
    );
  }
}
