import 'package:artohmapp/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/artist_influences.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/social_media.dart';
import 'package:artohmapp/presentation/edit_profile_screen/widgets/user_profile_field.dart';
import '../../widgets/custom_snackbar.dart';
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
    // final InfluencesController influencesController =
    //     Get.find<InfluencesController>();
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
            icon:
                Icon(Icons.close, color: Theme.of(context).colorScheme.primary),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: bodyContent(),
        bottomNavigationBar: CustomElevatedButton(
            onTap: () {
              Get.snackbar(
                'Success',
                'Changes Saved!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 24,
                ),
                duration: Duration(seconds: 3),
              );
              Future.delayed(Duration(seconds: 3), () {
                Get.offNamed(AppRoutes.userProfileContainerScreen);
              });
              // saveChanges(context);
            },
            text: "lbl_save_changes".tr,
            margin: EdgeInsets.only(
                left: 16.h, right: 16.h, bottom: 24.v, top: 6.v),
            buttonTextStyle: CustomTextStyles.titleSmallLatoWhiteA700Medium),
      ),
    );
  }

  bodyContent() {
    final InfluencesController influencesController =
        Get.find<InfluencesController>();
    return SizedBox(
      width: mediaQueryData.size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.h, right: 8.h, bottom: 4.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editProfile(),
              artStyles(),
              SizedBox(height: 36.v),
              socials(),
              SizedBox(height: 36.v),
              InfluencesView(controller: influencesController),
              SizedBox(height: 36.v),
            ],
          ),
        ),
      ),
    );
  }

  socials() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Socials".tr, style: theme.textTheme.titleSmall),
        SocialMediaButton(
          socialMedia: SocialMedia(
              name: 'Instagram',
              url: 'instagram://user?username={username}',
              logoPath: ImageConstant.imgProfileicons24x243),
          controller: SocialMediaController(),
        ),
        SocialMediaButton(
          socialMedia: SocialMedia(
              name: 'Pinterest',
              url: 'pinterest://user/{username}',
              logoPath: ImageConstant.imgProfileicons24x244),
          controller: SocialMediaController(),
        ),
      ],
    );
  }

  influences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_your_influences".tr, style: theme.textTheme.titleSmall),
        CustomTextFormField(
          controller: controller.inputTextController,
          focusNode: controller.influencesFocusNode,
          margin: EdgeInsets.only(top: 9.v, right: 7.h),
          hintText: "lbl_input_text".tr,
          hintStyle: CustomTextStyles.bodyLargeRobotoBlack90001,
          textInputAction: TextInputAction.done,
          borderDecoration: TextFormFieldStyleHelper.underLineRed,
        ),
      ],
    );
  }

  editProfile() {
    return Container(
      margin: EdgeInsets.only(top: 30.v, right: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
      decoration: AppDecoration.outlineBlack900011
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          changeImage(),
          SizedBox(height: 24.v),
          Column(
            children: controller.fields
                .map((field) => ProfileFieldWidget(field: field))
                .toList(),
          ),
          SizedBox(height: 24.v),
        ],
      ),
    );
  }

  artStyles() {
    return Container(
      width: 358.h,
      margin: EdgeInsets.only(
        top: 36.v,
      ),
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillBlue
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Text("msg_favorite_art_styles".tr, style: theme.textTheme.titleSmall),
          SizedBox(height: 15.v),
          CustomDropDown(
              width: 240.h,
              hintText: "Choose Style".tr,
              hintStyle: CustomTextStyles.bodyLargeBlack90001_2,
              items:
                  controller.editProfileModelObj.value.dropdownItemList.value,
              borderDecoration: DropDownStyleHelper.outlineBlackTL81,
              onChanged: (value) {
                controller.onSelected(value);
              }),
          SizedBox(height: 12.v),
          Obx(
            () => Wrap(
              runSpacing: 12.v,
              spacing: 12.h,
              children: List<Widget>.generate(
                controller.editProfileModelObj.value.selectedstylesItemList
                    .value.length,
                (index) {
                  SelectedstylesItemModel model = controller.editProfileModelObj
                      .value.selectedstylesItemList.value[index];
                  return SelectedstylesItemWidget(model);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeImage() {
    return Column(
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
            margin: EdgeInsets.only(left: 8.h),
            child: CustomImageView(svgPath: ImageConstant.imgClock),
          ),
          onTap: () {
            controller.changeProfilePhoto();
          },
        ),
      ],
    );
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

void saveChanges(BuildContext context) {
  CustomSnackBar.show(
    context,
    'Changes Saved!',
    Icons.check_circle,
    'OK',
  );
}
