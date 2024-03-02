import '../../widgets/custom_appbar_component.dart';
import 'widgets/comment_visibility_widget.dart';
import 'widgets/artwork_visibility_widget.dart';
import 'controller/privacy_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class PrivacyScreen extends GetWidget<PrivacyController> {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "Privacy Settings".tr,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              accountVisibility(),
              SizedBox(height: 26.v),
              artworkVisibility(),
              SizedBox(height: 26.v),
              commentVisibility(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  commentVisibility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_comment_visibility".tr, style: theme.textTheme.titleMedium),
        SizedBox(height: 11.v),
        Text("msg_choose_who_can_comment".tr,
            style: CustomTextStyles.bodyMediumBlack),
        SizedBox(height: 16.v),
        Obx(
          () => Wrap(
            runSpacing: 20.v,
            spacing: 20.h,
            children: controller
                .privacyModelObj.value.commentVisibilityList.value
                .map((model) {
              return CommentVisibilityWidget(
                model,
                () {
                  controller.privacyModelObj.value.commentVisibilityList.value
                      .forEach((m) {
                    if (m != model) {
                      m.isSelected.value = false;
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  artworkVisibility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_artwork_visibility".tr, style: theme.textTheme.titleMedium),
        SizedBox(height: 11.v),
        Text("msg_choose_who_can_see".tr,
            style: CustomTextStyles.bodyMediumBlack),
        SizedBox(height: 16.v),
        Obx(
          () => Wrap(
            runSpacing: 20.v,
            spacing: 20.h,
            children: controller
                .privacyModelObj.value.artworkVisibilityList.value
                .map((model) {
              return ArtworkVisibilityWidget(
                model,
                onSelected: () {
                  controller.privacyModelObj.value.artworkVisibilityList.value
                      .forEach((m) {
                    if (m != model) {
                      m.isSelected.value = false;
                    }
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  accountVisibility() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_account_visibility".tr, style: theme.textTheme.titleMedium),
        SizedBox(height: 11.v),
        Text("msg_choose_who_can_view".tr,
            style: CustomTextStyles.bodyMediumBlack),
        Container(
          margin: EdgeInsets.only(top: 16.v, right: 1.h),
          padding: EdgeInsets.all(16.h),
          decoration: AppDecoration.fillSecondaryContainer
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.v, bottom: 1.v),
                    child: Text(
                      "lbl_everyone".tr,
                      style: CustomTextStyles.bodyMediumLibreBaskerville,
                    ),
                  ),
                  Obx(
                    () => CustomSwitch(
                      value: controller.currentSetting.value ==
                          PrivacySetting.Everyone,
                      onChange: (value) {
                        controller.updateSwitchState(PrivacySetting.Everyone);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 4.v, bottom: 1.v),
                      child: Text("lbl_followers_only".tr,
                          style: CustomTextStyles.bodyMediumLibreBaskerville)),
                  Obx(
                    () => CustomSwitch(
                      value: controller.currentSetting.value ==
                          PrivacySetting.FollowersOnly,
                      onChange: (value) {
                        controller
                            .updateSwitchState(PrivacySetting.FollowersOnly);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 2.v, bottom: 3.v),
                      child: Text("lbl_private".tr,
                          style: CustomTextStyles.bodyMediumLibreBaskerville)),
                  Obx(
                    () => CustomSwitch(
                      value: controller.currentSetting.value ==
                          PrivacySetting.Private,
                      onChange: (value) {
                        controller.updateSwitchState(PrivacySetting.Private);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
