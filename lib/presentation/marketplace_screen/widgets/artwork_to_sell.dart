import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/marketplace_screen/controller/marketplace_controller.dart';
import 'package:artohmapp/presentation/marketplace_screen/models/seller_model.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/modal_contact_seller/modal_contact_seller.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ArtworkToSell extends StatelessWidget {
  final ArtworkForSaleController artworkForSaleController =
      Get.put(ArtworkForSaleController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        //categories in the body
        return Container(
          margin: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              artworkForSaleController.categories.length,
              (index) {
                var category = artworkForSaleController.categories[index];
                var artworks =
                    artworkForSaleController.getArtworksByCategory(category);
          
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artworkForSaleController.formatCategory(
                          category,
                        ),
                        style: CustomTextStyles.titleMedium,
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 420,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: artworks.length,
                          itemBuilder: (context, index) {
                            var artwork = artworks[index];
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: theme.colorScheme.outlineVariant,
                                    width: .8,
                                  )),
                              width: 240,
                              margin: EdgeInsets.only(right: 16),
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => ArtworkScreen(),
                                        arguments: artwork,
                                        binding: ArtworkBinding(),
                                      );
                                    },
                                    child: Image.asset(
                                      artwork.imageUrl,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    artwork.title,
                                    style: CustomTextStyles.titleSmall,
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          artwork.artist,
                                          style: CustomTextStyles.bodyMedium,
                                        ),
                                        Text(
                                          artwork.price != null
                                              ? artwork.price!.toString()
                                              : 'Price not available',
                                          style: CustomTextStyles
                                              .titleSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: theme.colorScheme.onBackground,
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          buttonStyle: CustomButtonStyles.fillPrimaryButtonRounded,
                                          text: 'Contact Seller',
                                          onTap: () {
                                            Get.bottomSheet(
                                              ContactSellerBottomSheet(
                                                seller: seller,
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

    