import 'controller/artwork_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/app_bar/appbar_iconbutton.dart';
import 'package:artohmapp/widgets/app_bar/appbar_image_1.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ArtworkScreen extends GetWidget<ArtworkController> {
  const ArtworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: 66.v,
            leadingWidth: double.maxFinite,
            leading: AppbarIconbutton(
                svgPath: ImageConstant.imgArrowleft,
                margin: EdgeInsets.only(left: 18.h, top: 21.v, right: 344.h),
                onTap: () {
                  onTapArrowleftone();
                }),
            actions: [
              AppbarImage1(
                  svgPath: ImageConstant.imgMask,
                  margin: EdgeInsets.symmetric(horizontal: 9.h))
            ]),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 24.v, bottom: 32.v),
            child: Padding(
              padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 5.v),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle11332x358,
                    height: 401.v,
                    width: 360.h,
                    radius: BorderRadius.circular(8.h),
                  ),
                  SizedBox(height: 24.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_ethereal_enchantment".tr,
                              style: CustomTextStyles.titleMediumRoboto),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h, top: 14.v),
                            child: Row(
                              children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgFavorite,
                                    height: 35.v,
                                    width: 37.h),
                                InkWell(
                                  onTap: () {
                                    showModal(context);
                                  },
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgShare,
                                    height: 24.v,
                                    width: 21.h,
                                    margin: EdgeInsets.only(
                                        left: 30.h, top: 5.v, bottom: 5.v),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      CustomOutlinedButton(
                          height: 38.v,
                          width: 71.h,
                          text: "lbl_850".tr,
                          margin: EdgeInsets.symmetric(vertical: 16.v),
                          buttonTextStyle: theme.textTheme.titleMedium!)
                    ],
                  ),
                  SizedBox(height: 32.v),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.h, vertical: 9.v),
                      decoration: AppDecoration.fillPrimary1.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder15),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 2.v),
                            Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgFrame72,
                                  height: 30.adaptSize,
                                  width: 30.adaptSize),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.h, top: 6.v, bottom: 3.v),
                                  child: Text("lbl_sophia_anderson".tr,
                                      style: CustomTextStyles.bodyLargeInter)),
                              Spacer(),
                              CustomOutlinedButton(
                                  height: 30.v,
                                  width: 57.h,
                                  text: "lbl_follow".tr,
                                  buttonTextStyle: theme.textTheme.bodyMedium!)
                            ]),
                            Container(
                                width: 301.h,
                                margin: EdgeInsets.only(top: 18.v, right: 26.h),
                                child: Text("msg_a_captivating_blend".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.bodyLargeBlack90001
                                        .copyWith(height: 1.50)))
                          ])),
                  SizedBox(height: 24.v),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                    decoration: AppDecoration.outlineLightBlueA.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_no_comments_yet".tr,
                            style: theme.textTheme.titleMedium),
                        SizedBox(height: 10.v),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFrame72,
                                height: 30.adaptSize,
                                width: 30.adaptSize,
                                margin:
                                    EdgeInsets.only(top: 4.v, bottom: 42.v)),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    CustomTextFormField(
                                        controller:
                                            controller.commentController,
                                        hintText: "lbl_add_a_comment".tr,
                                        hintStyle: CustomTextStyles
                                            .bodyMediumBlack90001_4,
                                        textInputAction: TextInputAction.done,
                                        borderDecoration:
                                            TextFormFieldStyleHelper
                                                .fillLightBlueA,
                                        filled: true,
                                        fillColor: appTheme.lightBlueA700
                                            .withOpacity(0.08)),
                                    SizedBox(height: 4.v),
                                    CustomElevatedButton(
                                        width: 80.h,
                                        text: "lbl_send".tr,
                                        buttonStyle:
                                            CustomButtonStyles.fillLightBlueA,
                                        buttonTextStyle: CustomTextStyles
                                            .bodyMediumWhiteA700)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CustomOutlinedButton(
                              height: 36.v,
                              text: "lbl_add_to_cart".tr,
                              margin: EdgeInsets.only(right: 18.h),
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallLatoRed300Medium)),
                      Expanded(
                        child: CustomElevatedButton(
                            height: 36.v,
                            text: "lbl_buy_now".tr,
                            margin: EdgeInsets.only(left: 18.h),
                            buttonTextStyle: CustomTextStyles
                                .titleSmallLatoWhiteA700Medium_1),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] package to
  /// navigate to the previous screen in the navigation stack.
  onTapArrowleftone() {
    Get.back();
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
                Row(
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Text('Public'),
                      decoration: BoxDecoration(
                        color: Color(0xFFFEE9E9),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20.0)),
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
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('12 artworks'),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 160.0,
                            child:
                                Image.asset(ImageConstant.imgRectangle11200x1604),
                          ),
                          Container(
                            width: 160.0,
                            child:
                                Image.asset(ImageConstant.imgRectangle11200x1604),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('collection description'),
                    Flexible(
                        child: Text(
                            'Embrace the world of abstraction with our "Abstract Masterpieces" collection. Delve into the realm of non-representational art, where colors, shapes, and forms take center stage. '))
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: Text('Edit Collection'))
              ],
            ),
          ),
        ),
      );
    },
  );
}

// Widget _buildRow(IconData icon, String label, VoidCallback onTap) {
//   return InkWell(
//     onTap: onTap,
//     child: Row(
//       children: [
//         IconButton(
//           icon: Icon(icon),
//           onPressed: onTap,
//         ),
//         Text(label),
//       ],
//     ),
//   );
// }
