import 'package:artohmapp/presentation/collaborate_screen/widgets/listing_card.dart';
import '../../widgets/custom_appbar_component.dart';
import '../collaborate_screen/widgets/chipviewselect_item_widget.dart';
import 'controller/collaborate_controller.dart';
import 'models/chipviewselect_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_drop_down.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CollaborateScreen extends GetWidget<CollaborateController> {
  const CollaborateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "lbl_collaborate".tr,
          onBackPressed: () {
            Get.back(id: 1);
          },
        ),
        body: bodyContent(),
      ),
    );
  }

  bodyContent() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          // SizedBox(height: 24.v),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.h, bottom: 32.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FeaturedArtCollaborationCard(),
                    SizedBox(height: 32.v),

                    startCollaboration(),
                    // SizedBox(height: 32.v),
                    // artStyles(),
                    // SizedBox(height: 32.v),
                    // mediums(),
                    SizedBox(height: 32.v),
                    collaborateListings(),
                    SizedBox(height: 32.v),
                    yourListings(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  mediums() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_mediums".tr, style: theme.textTheme.titleMedium),
        SizedBox(height: 6.v),
        CustomDropDown(
          width: 160.h,
          hintText: "lbl_painting".tr,
          hintStyle: theme.textTheme.labelLarge!,
          items: controller.collaborateModelObj.value.dropdownItemList.value,
          contentPadding:
              EdgeInsets.only(left: 16.h, top: 11.v, bottom: 11.v, right: 8.v),
          borderDecoration: DropDownStyleHelper.fillLightBlueA,
          filled: true,
          fillColor: appTheme.lightBlueA700.withOpacity(0.08),
          onChanged: (value) {
            controller.onSelected(value);
          },
        ),
      ],
    );
  }

  artStyles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Art Styles".tr, style: theme.textTheme.titleMedium),
        SizedBox(
          height: 6.v,
        ),
        Obx(
          () => Wrap(
            runSpacing: 8.v,
            spacing: 8.h,
            children: List<Widget>.generate(
              controller.collaborateModelObj.value.chipviewselectItemList.value
                  .length,
              (index) {
                ChipviewselectItemModel model = controller.collaborateModelObj
                    .value.chipviewselectItemList.value[index];
                return ChipviewselectItemWidget(model);
              },
            ),
          ),
        ),
      ],
    );
  }

  collaborateListings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("msg_collaboration_listings".tr,
            style: theme.textTheme.titleMedium),
        SizedBox(
          height: 6.v,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListingCard(
                  imagePath: ImageConstant.imgRectangle11180x264,
                  onButtonPressed: () {
                    Get.toNamed(AppRoutes.collaborateitemScreen);
                  },
                  title: "msg_ai_infused_sculpture".tr,
                  subtitle: "msg_mark_turner_aiart".tr,
                  description: "msg_mark_s_bronze_sculpture".tr,
                ),
                SizedBox(
                  width: 20.h,
                ),
                ListingCard(
                  onButtonPressed: () {
                    Get.toNamed(AppRoutes.collaborateitemScreen);
                  },
                  imagePath: ImageConstant.imgRectangle11180x264,
                  title: "msg_harmony_of_nature".tr,
                  subtitle: "msg_sarah_smith_david2".tr,
                  description: "msg_sarah_s_intricate".tr,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  yourListings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Listings",
            style: theme.textTheme.titleMedium),
        SizedBox(
          height: 6.v,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListingCard(
                  imagePath: ImageConstant.imgRectangle11180x264,
                  onButtonPressed: () {
                    Get.toNamed(AppRoutes.collaborateitemScreen);
                  },
                  title: "msg_ai_infused_sculpture".tr,
                  subtitle: "msg_mark_turner_aiart".tr,
                  description: "msg_mark_s_bronze_sculpture".tr,
                ),
                SizedBox(
                  width: 20.h,
                ),
                ListingCard(
                  onButtonPressed: () {
                    Get.toNamed(AppRoutes.collaborateitemScreen);
                  },
                  imagePath: ImageConstant.imgRectangle11180x264,
                  title: "msg_harmony_of_nature".tr,
                  subtitle: "msg_sarah_smith_david2".tr,
                  description: "msg_sarah_s_intricate".tr,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  FeaturedArtCollaborationCard() {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 8.v),
      decoration: AppDecoration.outlineBlack
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.v),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "msg_featured_art_collaboration".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle11180x316,
            radius: BorderRadius.circular(8.h),
            margin: EdgeInsets.only(
              left: 8.h,
              top: 8.v,
              right: 8,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h, top: 12.v),
            child: Text(
              "msg_harmony_of_nature".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h, top: 7.v),
            child: Row(
              children: [
                SizedBox(
                  height: 30.v,
                  width: 60.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse1,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          radius: BorderRadius.circular(15.h),
                          alignment: Alignment.centerLeft),
                      CustomImageView(
                          imagePath: ImageConstant.imgEllipse130x30,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          radius: BorderRadius.circular(15.h),
                          alignment: Alignment.center),
                      CustomImageView(
                        imagePath: ImageConstant.imgEllipse11,
                        height: 30.adaptSize,
                        width: 30.adaptSize,
                        radius: BorderRadius.circular(15.h),
                        alignment: Alignment.centerRight,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h, top: 7.v, bottom: 5.v),
                  child: Text(
                    "msg_sarah_smith_david2".tr,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 9.v,
            ),
            child: Text(
              "msg_july_8_august".tr,
              style: CustomTextStyles.bodyMediumLight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.h, top: 8.v, right: 8.h),
            child: Text(
              "msg_sarah_s_intricate".tr,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium!.copyWith(height: 1.50),
            ),
          ),
        ],
      ),
    );
  }

  startCollaboration() {
    return Container(
      margin: EdgeInsets.only(right: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          style: BorderStyle.solid,
          color: appTheme.red300,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.v, vertical: 16.v),
      child: Column(
        children: [
          // Assuming you have a widget named 'AuthorImage' that displays the author's image
          // AuthorImage(),
          SizedBox(
            height: 16.v,
          ),
          Text(
            "\"Art is a harmony parallel with nature. Let's create it together.\"",
            style: CustomTextStyles.titleMediumLato.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 8.v,
          ),
          Text(
            "- Paul Cézanne",
            style: CustomTextStyles.titleMediumLato,
          ),
          SizedBox(
            height: 16.v,
          ),
          CustomElevatedButton(
            onTap: () {
              Get.toNamed(AppRoutes.newCollaborationItemPage);
            },
            text: 'Start a Collaboration',
          ),
        ],
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

  /// Navigates to the collaborateitemScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the collaborateitemScreen.
  onTapCurious() {
    Get.toNamed(
      AppRoutes.collaborateitemScreen,
    );
  }
}
