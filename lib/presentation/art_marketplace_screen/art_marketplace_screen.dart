import 'package:artohmapp/presentation/art_marketplace_screen/widgets/artwork_to_sell.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/custom_appbar_component.dart';
import '../art_marketplace_screen/widgets/marketplacechip_item_widget.dart';
import 'controller/art_marketplace_controller.dart';
import 'models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ArtMarketplaceScreen extends GetWidget<ArtMarketplaceController> {
  ArtMarketplaceScreen({Key? key}) : super(key: key);

  final FeaturedArtworksController featuredArtworksController =
      Get.put(FeaturedArtworksController());

  final ArtworkForSaleController artworkForSaleController =
      Get.put(ArtworkForSaleController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBarComponent(
            title: "lbl_market_place2".tr,
            onBackPressed: () {
              Get.back(id: 1);
            },
          ),
          body: bodyContent(context),
        ),
      ),
    );
  }

  bodyContent(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Wrap(
            children: artworkForSaleController.categories.map(
              (category) {
                return ChoiceChip(
                  label: Text(category),
                  selected: false,
                  onSelected: (selected) {
                    // artworkForSaleController.fetchArtworksForSale(category);
                  },
                );
              },
            ).toList(),
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 8),
          //   child: topChips(),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8.v),
                    // featuredCard(),
                    featuredArtwork(),
                    SizedBox(height: 8.v),
                    ArtworkToSell(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  featuredArtwork() {
    return Column(
      children: [
        SizedBox(height: 16),
        Obx(
          () => CarouselSlider.builder(
            itemCount: featuredArtworksController.featuredArtworks.length,
            itemBuilder: (context, index, realIndex) {
              var artwork = featuredArtworksController.featuredArtworks[index];
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => ArtworkScreen(),
                    arguments: artwork,
                    binding: ArtworkBinding(),
                  );
                },
                child: Container(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          artwork.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  artwork.title,
                                  style: CustomTextStyles.titleSmallBlack90001,
                                ),
                                Spacer(),
                                Text(
                                  "\$${artwork.price}",
                                  style: CustomTextStyles.titleMediumLato,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              artwork.artist,
                              style: CustomTextStyles.bodyMediumBlack,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              // aspectRatio: 16 / 9,
              aspectRatio: 12 / 16,
              viewportFraction: 0.8,
              autoPlayInterval: Duration(seconds: 10),
            ),
          ),
        ),
      ],
    );
  }

  artwork() {
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: controller.filteredArtworks.map((artwork) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 200, // Adjust this value as needed
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ArtworkToSell(),
                      SizedBox(width: 8),
                      // Add more ArtworkToSells here...
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "msg_ethereal_enchantment".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          Text(
                            'lbl_850'.tr,
                            style: theme.textTheme.titleSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "lbl_sophia_anderson".tr,
                        style: CustomTextStyles.bodyMediumBlack,
                      ),
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

  topChipss() {
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
