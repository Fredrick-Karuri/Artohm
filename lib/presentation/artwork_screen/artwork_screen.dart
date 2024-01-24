import '../../widgets/custom_appbar_component.dart';
import 'controller/artwork_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ArtworkScreen extends GetWidget<ArtworkController> {
  const ArtworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBarComponent(
          hasTitle: false,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: bodyContent(),
      ),
    );
  }
  


  bodyContent() {
    return SizedBox(
      width: mediaQueryData.size.width,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24.v, bottom: 32.v),
        child: Padding(
          padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 5.v),
          child: Column(
            children: [
              Hero(
                tag: 'artworkImage',
                child: CustomImageView(
                  imagePath: ImageConstant.imgRectangle11332x358,
                  height: 401.v,
                  width: 360.h,
                  radius: BorderRadius.circular(8.h),
                ),
              ),
              SizedBox(height: 24.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
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
                            IconButton(
                              color: theme.primaryColor,
                              onPressed: () {},
                              iconSize: 28,
                              icon: Icon(Icons.favorite_outline),
                            ),
                            IconButton(
                              color: theme.primaryColor,
                              onPressed: () {
                                Share.share(
                                    'Check out this image: https://example.com/my-image.jpg');
                                // showModal(context);
                              },
                              icon: Icon(Icons.share),
                              iconSize: 28,
                            ),
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
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 9.v),
                decoration: AppDecoration.fillPrimary1
                    .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 2.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgFrame72,
                                height: 30.adaptSize,
                                width: 30.adaptSize),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 8.h, top: 6.v, bottom: 3.v),
                                child: Text("lbl_sophia_anderson".tr,
                                    style: CustomTextStyles.bodyLargeInter)),
                          ],
                        ),
                        OutlinedButton(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 2),
                            child: Text(
                              'Follow',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Container(
                        width: 301.h,
                        margin: EdgeInsets.only(top: 18.v, right: 26.h),
                        child: Text("msg_a_captivating_blend".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyLargeBlack90001
                                .copyWith(height: 1.50)))
                  ],
                ),
              ),
              SizedBox(height: 24.v),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                decoration: AppDecoration.outlineLightBlueA
                    .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
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
                            margin: EdgeInsets.only(top: 4.v, bottom: 42.v)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomTextFormField(
                                    controller: controller.commentController,
                                    hintText: "lbl_add_a_comment".tr,
                                    hintStyle:
                                        CustomTextStyles.bodyMediumBlack90001_4,
                                    textInputAction: TextInputAction.done,
                                    borderDecoration:
                                        TextFormFieldStyleHelper.fillLightBlueA,
                                    filled: true,
                                    fillColor: appTheme.lightBlueA700
                                        .withOpacity(0.08)),
                                SizedBox(height: 4.v),
                                CustomElevatedButton(
                                    width: 80.h,
                                    text: "lbl_send".tr,
                                    buttonStyle:
                                        CustomButtonStyles.fillLightBlueA,
                                    buttonTextStyle:
                                        CustomTextStyles.bodyMediumWhiteA700)
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
                        buttonTextStyle:
                            CustomTextStyles.titleSmallLatoWhiteA700Medium_1),
                  )
                ],
              )
            ],
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
