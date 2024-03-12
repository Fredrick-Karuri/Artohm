import 'package:artohmapp/presentation/marketplace_screen/widgets/artwork_to_sell.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/custom_appbar_component.dart';
import 'widgets/marketplacechip_item_widget.dart';
import 'controller/marketplace_controller.dart';
import 'models/marketplacechip_item_model.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:flutter/material.dart';

class MarketplaceScreen extends GetWidget<MarketplaceController> {
  MarketplaceScreen({Key? key}) : super(key: key);

  final FeaturedArtworksController featuredArtworksController =
      Get.put(FeaturedArtworksController());

  final ArtworkForSaleController artworkForSaleController =
      Get.put(ArtworkForSaleController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBarComponent(
          title: "lbl_market_place2".tr,
          onBackPressed: () {
            Get.back(id: 1);
          },
        ),
        body: bodyContent(context),
      ),
    );
  }

  bodyContent(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: artworkForSaleController.categories.map(
                (category) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: false,
                      onSelected: (selected) {
                        // artworkForSaleController.fetchArtworksForSale(category);
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
    
        // Padding(
        //   padding: EdgeInsets.only(top: 8),
        //   child: topChips(),
        // ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8.v),
                // featuredCard(),
                featuredArtwork(),
                ArtworkToSell(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  featuredArtwork() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 40),
      child: Column(
        children: [
          Obx(
            () => CarouselSlider.builder(
              itemCount: featuredArtworksController.featuredArtworks.length,
              itemBuilder: (context, index, realIndex) {
                var artwork =
                    featuredArtworksController.featuredArtworks[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ArtworkScreen(),
                      arguments: artwork,
                      binding: ArtworkBinding(),
                    );
                  },
                  child: Container(
                    child: SingleChildScrollView(
                      // Add this line
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
                                      style: CustomTextStyles
                                          .titleSmall,
                                    ),
                                    Spacer(),
                                    Text(
                                      "\$${artwork.price}",
                                      style: CustomTextStyles
                                          .titleMediumLatoOnBackground,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  artwork.artist,
                                  style: CustomTextStyles.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 14 / 16,
                viewportFraction: 0.8,
                autoPlayInterval: Duration(seconds: 5),
              ),
            ),
          ),
        ],
      ),
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
