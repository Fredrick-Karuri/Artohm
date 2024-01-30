import 'package:artohmapp/presentation/art_marketplace_screen/widgets/artwork_card.dart';
import '../../widgets/custom_appbar_component.dart';
import '../art_marketplace_screen/widgets/marketplacechip_item_widget.dart';
import 'controller/art_marketplace_controller.dart';
import 'models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ArtMarketplaceScreen extends GetWidget<ArtMarketplaceController> {
  const ArtMarketplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarComponent(
          title: "lbl_market_place2".tr,
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
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: topChips(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  bottom: 32.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.v),
                    featuredCard(),
                    SizedBox(height: 24.v),
                    artwork(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  artwork() {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.filteredArtworks.map((artwork) {
              return Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCardWidget(
                      artwork: artwork,
                      card: artwork,
                    ),
                    SizedBox(width: 8),
                    // Add more CustomCardWidgets here...
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }

  featuredCard() {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle11332x358,
              radius: BorderRadius.circular(8.h),
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20.v, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("msg_ethereal_enchantment".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 17.v),
                              Text("lbl_sophia_anderson".tr,
                                  style: CustomTextStyles.bodyMediumBlack90001)
                            ]),
                      ),
                      Flexible(
                        child: CustomOutlinedButton(
                            height: 38.v,
                            // width: 64.h,
                            text: "lbl_850".tr,
                            margin: EdgeInsets.only(
                                left: 95.h, top: 8.v, bottom: 8.v),
                            buttonTextStyle: theme.textTheme.titleMedium!),
                      )
                    ],
                  ),
                  SizedBox(height: 24.v),
                  CustomElevatedButton(
                    fullWidth: true,
                    text: "lbl_view_artwork".tr,
                    buttonTextStyle:
                        CustomTextStyles.titleSmallRobotoWhiteA700Medium,
                    onTap: () {
                      onTapViewartwork();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

topChips() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, bottom: 8, right: 10),
    child: Obx(
      () => SizedBox(
        height: 72, // Adjust this value as needed
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.artMarketplaceModelObj.value
              .marketplaceChipItemList.value.length,
          itemBuilder: (context, index) {
            MarketplaceChipItemModel model = controller.artMarketplaceModelObj
                .value.marketplaceChipItemList.value[index];
            return MarketplaceChipItemWidget(model);
          },
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

  /// Navigates to the artworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkScreen.
  onTapViewartwork() {
    Get.toNamed(
      AppRoutes.artworkScreen,
    );
  }
}
