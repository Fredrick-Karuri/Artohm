import '../../../widgets/custom_elevated_button.dart';
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
                        // showBottomSheet: true,
                        onTap: () {
                          showModal(context);
                        },
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 18.v,
                        width: 18.h,
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
                        // showBottomSheet: true,
                        onTap: () {
                          showModal(context);
                        },
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 18.v,
                        width: 18.h,
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
                        // showBottomSheet: true,
                        onTap: () {
                          showModal(context);
                        },
                        svgPath: ImageConstant.imgIconsWhiteA700,
                        height: 20.v,
                        width: 18.h,
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
            ],
          ),
        ),
      ],
    );
  }
}

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 0.94,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFEE9E9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              border: Border.all(
                color: Color.fromRGBO(245, 140, 140, 0.075),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  blurRadius: 4.0,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 13.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.info),
                                onPressed: () {},
                              ),
                              Text('View Artwork Info'),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite),
                                onPressed: () {},
                              ),
                              Text('Like'),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {},
                              ),
                              Text('Add to Collection'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


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