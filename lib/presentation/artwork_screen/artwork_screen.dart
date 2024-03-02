import 'package:artohmapp/presentation/art_marketplace_screen/models/seller_model.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/createcollection_screen/widgets/create_collections_modal.dart';
import 'package:artohmapp/presentation/modal_contact_seller/modal_contact_seller.dart';
import '../../widgets/custom_appbar_component.dart';
import 'controller/artwork_controller.dart';
import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
import 'package:artohmapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ArtworkScreen extends GetView<ArtworkController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBarComponent(
          hasTitle: false,
          trailingIcon: Icons.share,
          onTapTrailingIcon: () {
            Share.share(
              controller.artwork.value.imageUrl,
            );
          },
          hasTrailingIcon: true,
          onBackPressed: () {
            Get.back();
          },
        ),
        body: bodyContent(context),
      ),
    );
  }

  bodyContent(context) {
    return Obx(() {
      final artwork = controller.artwork.value;
      return SizedBox(
        width: mediaQueryData.size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 8.v, bottom: 32.v),
          child: Padding(
            padding: EdgeInsets.only(left: 15.h, right: 15.h, bottom: 5.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: artwork.id,
                  child: CustomImageView(
                    imagePath: artwork.imageUrl,
                    radius: BorderRadius.circular(8.h),
                  ),
                ),
                SizedBox(height: 8.v),
                artistInfo(artwork, context, controller),
                SizedBox(height: 24.v),
                artworkInfo(artwork),
                SizedBox(height: 32.v),
                tags(artwork),
                SizedBox(height: 32.v),
                tools(artwork),
                SizedBox(height: 32.v),
                // Row(
                //   children: [
                //     Text(
                //       'Image size',
                //       style: CustomTextStyles.titleMediumLato,
                //     ),
                //     Chip(
                //       label: Text(
                //         artwork.imageSize,
                //       ),
                //     ),
                //   ],
                // ),

                comment(controller, context),
                SizedBox(height: 32.v),
                actions(controller)
              ],
            ),
          ),
        ),
      );
    });
  }

  artworkInfo(Artwork artwork) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.h,
        bottom: 24.v,
        top: 16.v,
        right: 16.h,
      ),
      decoration: AppDecoration.fillPrimaryOpacity
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                artwork.title,
                style: CustomTextStyles.titleLargeBlack,
              ),
              Text(
                "\$${artwork.price}",
                style: CustomTextStyles.bodyLarge18.copyWith(),
              ),
            ],
          ),
          SizedBox(height: 8.v),
          Text(
            artwork.description, // Use the description from the Artwork object
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyLargeBlack.copyWith(
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }

  tags(Artwork artwork) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (artwork.tags != null && artwork.tags!.isNotEmpty) ...[
          Text(
            'Tags',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(height: 8.v),
          Wrap(
            children: artwork.tags!
                .map(
                  (category) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Chip(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                      labelStyle: theme.textTheme.bodyMedium,
                      label: Text(
                        category,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  tools(Artwork artwork) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
      decoration: AppDecoration.fillSecondaryOpacity
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (artwork.tools != null && artwork.tools!.isNotEmpty) ...[
            Text(
              'Tools',
              style: CustomTextStyles.titleMediumLato,
            ),
            SizedBox(height: 8.v),
            Column(
              children: artwork.tools!
                  .asMap()
                  .entries
                  .map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical:
                              4.0), // Adjust the vertical padding as needed
                      child: Row(
                        children: [
                          Text('${entry.key + 1}.',
                              style: theme.textTheme.bodyMedium),

                          SizedBox(
                              width:
                                  8.0), // Adjust the space between the number and the text as needed
                          Expanded(
                            child: Text(
                              entry.value,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        ],
      ),
    );
  }
}

actions(controller) {
  //if artworks is marked as sellable then button to contact the seller

  return CustomElevatedButton(
    height: 36.v,
    onTap: () {
      Get.bottomSheet(
        ContactSellerBottomSheet(
          seller: seller,
        ),
      );
    },
    text: 'Contact Seller',
  );
}

comment(ArtworkController controller, context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
    decoration: AppDecoration.outlineLightBlueA
        .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _showCommentsBottomSheet(
            context,
            controller,
          ), // Pass the BuildContext to the method
          child: Text(
            '${controller.getCommentCount()} comments',
            style: theme.textTheme.titleMedium,
          ),
        ),
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
                        hintStyle: CustomTextStyles.bodyMediumBlack,
                        textInputAction: TextInputAction.done,
                        borderDecoration:
                            TextFormFieldStyleHelper.fillSecondaryOpacity,
                        filled: true,
                        fillColor: appTheme.lightBlueA700.withOpacity(0.08)),
                    SizedBox(height: 8.v),
                    CustomElevatedButton(
                      onTap: () {
                        controller.addComment(
                            controller.commentController.text, 'userName');
                      },
                      width: 80.h,
                      text: "lbl_send".tr,
                      buttonStyle: CustomButtonStyles.fillSecondaryOpacity,
                      buttonTextStyle: CustomTextStyles.bodyMediumWhiteA700,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

artistInfo(Artwork artwork, context, controller) {
  FavoriteArtworksController favoriteArtworksController = Get.find();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: artwork
                    .imageUrl, // Use the imageUrl from the Artwork object
                height: 36.adaptSize,
                width: 36.adaptSize,
                radius: BorderRadius.circular(18.h),
                // alignment: Alignment.centerLeft,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h, top: 6.v, bottom: 3.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      artwork.artist, // Use the artist from the Artwork object
                      style: CustomTextStyles.bodyLargeBlack,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      ' 4 Followers',
                      style: CustomTextStyles.bodyMediumBlack,
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              side: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              // if (artwork.isFollowed.value) {
              //   artwork.isFollowed.value = false;
              // } else {
              //   artwork.isFollowed.value = true;
              // }
            },
            child: Text(
              'Follow',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 8.h, top: 14.v),
        child: Row(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    artwork.isFavorite.toggle();
                    favoriteArtworksController.updateFavoriteArtworks();
                  },
                  icon: Icon(
                    artwork.isFavorite.value
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: theme.colorScheme.outline,
                  ),
                ),
                Text(
                  favoriteArtworksController.favoriteArtworks.length.toString(),
                  style: CustomTextStyles.bodyMediumBlack,
                ),
              ],
            ),
            SizedBox(width: 20.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    _showCommentsBottomSheet(
                      context,
                      controller,
                    );
                  },
                  icon: Icon(
                    Icons.comment,
                    color: theme.colorScheme.outline,
                  ),
                ),
                Text(
                  controller.getCommentCount().toString(),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(width: 20.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.dialog(CollectionsModal(artwork: artwork));
                  },
                  icon: Icon(
                    Icons.collections,
                    color: theme.colorScheme.outline,
                  ),
                ),
                Text(
                  //change to collection count
                  favoriteArtworksController.favoriteArtworks.length.toString(),
                  style: CustomTextStyles.bodyMediumBlack,
                ),
              ],
            ),
            SizedBox(width: 20.h),
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

void _showCommentsBottomSheet(BuildContext context, controller) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(16.0), // Add some padding
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children:
                  controller.artwork.value.comments.map<Widget>((comment) {
                return ListTile(
                  title: Text(comment.text,
                      style:
                          TextStyle(fontSize: 18.0)), // Increase the font size
                  subtitle: Text(
                    'By ${comment.userName} at ${comment.timestamp}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ), // Show the user's name and the timestamp
                );
              }).toList(),
            ),
          ),
        ),
      );
    },
  );
}

// IconButton(
//   color: theme.primaryColor,
//   onPressed: () {
//     FavoriteArtworksController favoriteArtworksController = Get
//         .find(); // Get the instance of LikedArtworksController
//     favoriteArtworksController
//         .toggleLike(artwork); // Call toggleLike function
//   },
//   iconSize: 28,
//   icon: Icon(favoriteArtworksController.likedArtworksIds
//           .toList()
//           .contains(artwork.id)
//       ? Icons.favorite
//       : Icons.favorite_outline),
// ),
