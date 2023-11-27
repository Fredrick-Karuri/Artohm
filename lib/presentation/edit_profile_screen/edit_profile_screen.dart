import '../edit_profile_screen/widgets/selectedstyles_item_widget.dart';
import 'controller/edit_profile_controller.dart';
import 'models/selectedstyles_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                leadingWidth: 46.h,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  iconSize: 40,
                  icon: Icon(Icons.close,
                      color: Theme.of(context).colorScheme.primary),
                )),
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.h, right: 8.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 30.v, right: 6.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.h, vertical: 15.v),
                                  decoration: AppDecoration.outlineBlack900011
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgEllipse12,
                                          height: 80.adaptSize,
                                          width: 80.adaptSize,
                                          radius: BorderRadius.circular(40.h),
                                        ),
                                        SizedBox(height: 16.v),
                                        CustomOutlinedButton(
                                            width: 157.h,
                                            text: "lbl_change_image".tr,
                                            rightIcon: Container(
                                              margin:
                                                  EdgeInsets.only(left: 8.h),
                                              child: CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgClock),
                                            ),
                                            onTap: () {
                                              onTapChangeimage();
                                            }),
                                        SizedBox(height: 24.v),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                                svgPath: ImageConstant
                                                    .imgProfileiconsRed30024x24,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize,
                                                margin: EdgeInsets.only(
                                                    bottom: 54.v)),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.h),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 2.v,
                                                                    bottom:
                                                                        3.v),
                                                            child: Text(
                                                                "lbl_username"
                                                                    .tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .titleSmall)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgShareRed300,
                                                            height: 24.v,
                                                            width: 22.h)
                                                      ],
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 3.h,
                                                                top: 19.v),
                                                        child: Text(
                                                            "lbl_artlover1".tr,
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium)),
                                                    SizedBox(height: 16.v),
                                                    Divider()
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgMailRed300,
                                                  height: 24.adaptSize,
                                                  width: 24.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      bottom: 54.v)),
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 24.h),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: 2
                                                                              .v,
                                                                          bottom: 3
                                                                              .v),
                                                                      child: Text(
                                                                          "lbl_email"
                                                                              .tr,
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleSmall)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgShareRed300,
                                                                      height:
                                                                          24.v,
                                                                      width:
                                                                          22.h)
                                                                ]),
                                                            SizedBox(
                                                                height: 19.v),
                                                            Text(
                                                                "msg_emailemail_xyz_com"
                                                                    .tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium),
                                                            SizedBox(
                                                                height: 16.v),
                                                            Divider()
                                                          ])))
                                            ]),
                                        SizedBox(height: 15.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgProfileicons24x241,
                                                  height: 24.adaptSize,
                                                  width: 24.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      bottom: 75.v)),
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 24.h),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: 2
                                                                              .v,
                                                                          bottom: 3
                                                                              .v),
                                                                      child: Text(
                                                                          "lbl_bio"
                                                                              .tr,
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleSmall)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgShareRed300,
                                                                      height:
                                                                          24.v,
                                                                      width:
                                                                          22.h)
                                                                ]),
                                                            Container(
                                                                width: 264.h,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 18
                                                                            .v,
                                                                        right: 14
                                                                            .h),
                                                                child: Text(
                                                                    "msg_exploring_the_beauty"
                                                                        .tr,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyMedium!
                                                                        .copyWith(
                                                                            height:
                                                                                1.50))),
                                                            SizedBox(
                                                                height: 13.v),
                                                            Divider()
                                                          ])))
                                            ]),
                                        SizedBox(height: 15.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgProfileicons24x242,
                                                  height: 24.adaptSize,
                                                  width: 24.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      bottom: 54.v)),
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 24.h),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: 2
                                                                              .v,
                                                                          bottom: 3
                                                                              .v),
                                                                      child: Text(
                                                                          "lbl_location"
                                                                              .tr,
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleSmall)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgShareRed300,
                                                                      height:
                                                                          24.v,
                                                                      width:
                                                                          22.h)
                                                                ]),
                                                            SizedBox(
                                                                height: 19.v),
                                                            Text(
                                                                "lbl_nairobi_kenya"
                                                                    .tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium),
                                                            SizedBox(
                                                                height: 16.v),
                                                            Divider()
                                                          ])))
                                            ]),
                                        SizedBox(height: 15.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgGlobeRed300,
                                                  height: 24.adaptSize,
                                                  width: 24.adaptSize,
                                                  margin: EdgeInsets.only(
                                                      bottom: 54.v)),
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 23.h),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: 2
                                                                              .v,
                                                                          bottom: 3
                                                                              .v),
                                                                      child: Text(
                                                                          "lbl_website"
                                                                              .tr,
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleSmall)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgShareRed300,
                                                                      height:
                                                                          24.v,
                                                                      width:
                                                                          22.h)
                                                                ]),
                                                            SizedBox(
                                                                height: 18.v),
                                                            GestureDetector(
                                                                onTap: () {
                                                                  onTapTxtWeburl();
                                                                },
                                                                child: Text(
                                                                    "msg_www_artlover_com"
                                                                        .tr,
                                                                    style: theme
                                                                        .textTheme
                                                                        .bodyMedium)),
                                                            SizedBox(
                                                                height: 17.v),
                                                            Divider()
                                                          ])))
                                            ])
                                      ])),
                              Container(
                                  width: 358.h,
                                  margin:
                                      EdgeInsets.only(top: 36.v, right: 7.h),
                                  padding: EdgeInsets.all(16.h),
                                  decoration: AppDecoration.fillBlue.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder15),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 2.v),
                                        Text("msg_favorite_art_styles".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 15.v),
                                        CustomDropDown(
                                            width: 160.h,
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 12.v, 16.h, 11.v),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgProfileiconsRed30012x18)),
                                            hintText: "lbl_surrealism".tr,
                                            hintStyle: CustomTextStyles
                                                .bodyLargeBlack90001_2,
                                            items: controller
                                                .editProfileModelObj
                                                .value
                                                .dropdownItemList!
                                                .value,
                                            borderDecoration:
                                                DropDownStyleHelper
                                                    .outlineBlackTL81,
                                            onChanged: (value) {
                                              controller.onSelected(value);
                                            }),
                                        SizedBox(height: 12.v),
                                        Obx(() => Wrap(
                                            runSpacing: 12.v,
                                            spacing: 12.h,
                                            children: List<Widget>.generate(
                                                controller
                                                    .editProfileModelObj
                                                    .value
                                                    .selectedstylesItemList
                                                    .value
                                                    .length, (index) {
                                              SelectedstylesItemModel model =
                                                  controller
                                                      .editProfileModelObj
                                                      .value
                                                      .selectedstylesItemList
                                                      .value[index];
                                              return SelectedstylesItemWidget(
                                                  model);
                                            })))
                                      ])),
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 36.v, right: 7.h),
                                  padding: EdgeInsets.all(16.h),
                                  decoration: AppDecoration.fillPink.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.circleBorder15),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                            svgPath: ImageConstant
                                                .imgProfileicons24x243,
                                            height: 24.adaptSize,
                                            width: 24.adaptSize,
                                            margin:
                                                EdgeInsets.only(bottom: 37.v)),
                                        Expanded(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.h),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 3.v,
                                                                    bottom:
                                                                        2.v),
                                                            child: Text(
                                                                "lbl_artlover"
                                                                    .tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .titleSmall)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgShareRed300,
                                                            height: 24.v,
                                                            width: 22.h)
                                                      ]),
                                                      SizedBox(height: 18.v),
                                                      Text("lbl_pinterest".tr,
                                                          style: theme.textTheme
                                                              .bodyMedium)
                                                    ])))
                                      ])),
                              Container(
                                margin: EdgeInsets.only(top: 8.v, right: 7.h),
                                padding: EdgeInsets.all(16.h),
                                decoration: AppDecoration.fillPink50.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.circleBorder15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                        svgPath:
                                            ImageConstant.imgProfileicons24x244,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                        margin: EdgeInsets.only(bottom: 37.v)),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 24.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3.v, bottom: 2.v),
                                                  child: Text("lbl_artlover".tr,
                                                      style: theme.textTheme
                                                          .titleSmall)),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgShareRed300,
                                                  height: 24.v,
                                                  width: 22.h)
                                            ]),
                                            SizedBox(height: 19.v),
                                            Text("lbl_instagram".tr,
                                                style:
                                                    theme.textTheme.bodyMedium)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 36.v),
                              Text("lbl_your_influences".tr,
                                  style: theme.textTheme.titleSmall),
                              CustomTextFormField(
                                  controller: controller.inputTextController,
                                  margin: EdgeInsets.only(top: 9.v, right: 7.h),
                                  hintText: "lbl_input_text".tr,
                                  hintStyle: CustomTextStyles
                                      .bodyLargeRobotoBlack90001,
                                  textInputAction: TextInputAction.done,
                                  borderDecoration:
                                      TextFormFieldStyleHelper.underLineRed)
                            ])))),
            bottomNavigationBar: CustomElevatedButton(
                text: "lbl_save_changes".tr,
                margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 24.v),
                buttonTextStyle:
                    CustomTextStyles.titleSmallLatoWhiteA700Medium)));
  }

  /// Navigates to the uploadArtworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the uploadArtworkScreen.
  onTapChangeimage() {
    Get.toNamed(
      AppRoutes.uploadArtworkScreen,
    );
  }

  onTapTxtWeburl() {
    // TODO: implement Actions
  }
}
