import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/controller/art_marketplace_controller.dart';
import 'package:artohmapp/presentation/art_marketplace_screen/models/seller_model.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
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
        return Column(
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
                                borderRadius: BorderRadius.circular(8),
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
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  artwork.title,
                                  style: CustomTextStyles.titleSmallBlack90001,
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
                                        style: CustomTextStyles.bodyMediumBlack,
                                      ),
                                      Text(
                                        artwork.price != null
                                            ? artwork.price!.toString()
                                            : 'Price not available',
                                        style: CustomTextStyles
                                            .titleSmallBlack90001,
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
        );
      },
    );
  }
}

    // return Container(
    //   width: 240,
    //   // height: double.maxFinite,
    //   padding: EdgeInsets.only(right: 10),
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         child: Stack(
    //           alignment: Alignment.bottomRight,
    //           children: [
    //             CustomImageView(
    //               fit: BoxFit.fill,
    //               // imagePath: card.imagePath,
    //               imagePath: artwork.imagePath,
    //               radius: BorderRadius.circular(8.h),
    //               alignment: Alignment.center,
    //             ),
    //             IconButton(
    //               onPressed: () {
    //                 ArtworkCardModalState.showModal(context);
    //               },
    //               icon: Icon(
    //                 Icons.more_vert_outlined,
    //                 color: appTheme.whiteA700,
    //                 size: 28,
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       SizedBox(height: 12.v),
    //       Container(
    //         padding: EdgeInsets.only(bottom: 20),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   artwork.title.tr,
    //                   style: theme.textTheme.titleSmall,
    //                 ),
    //                 SizedBox(height: 6.v),
    //                 Text(
    //                   artwork.artist.tr,
    //                   style: theme.textTheme.bodyMedium,
    //                 ),
    //               ],
    //             ),
    //             Container(
    //               padding: EdgeInsets.symmetric(
    //                 horizontal: 8.h,
    //                 vertical: 4.v,
    //               ),
    //               decoration: AppDecoration.outlineBlack90001.copyWith(
    //                   borderRadius: BorderRadiusStyle.roundedBorder4,
    //                   color: appTheme.blue50),
    //               child: Text(
    //                 artwork.price.tr,
    //                 style: theme.textTheme.labelLarge,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Row(
    //         children: [
    //           IconButton(
    //             onPressed: () {},
    //             icon: Icon(
    //               Icons.favorite_border_outlined,
    //             ),
    //           ),
    //           SizedBox(width: 8),
    //           Expanded(
    //             child: CustomElevatedButton(
    //               onTap: () {
    //                 Get.bottomSheet(ContactSellerBottomSheet(seller: seller));
    //               },
    //               text: 'Contact Seller',
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );

