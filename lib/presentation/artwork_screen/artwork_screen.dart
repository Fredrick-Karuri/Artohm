import 'package:artohmapp/presentation/marketplace_screen/models/seller_model.dart';
import 'package:artohmapp/presentation/artist_profile_screen/controller/artist_profile_controller.dart';
import 'package:artohmapp/presentation/artist_profile_screen/models/artist_profile_model.dart';
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
      top: false,
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
                AspectRatio(
                  aspectRatio: 12/15,
                  child: Hero(
                    tag: artwork.id,
                    child: CustomImageView(
                      imagePath: artwork.imageUrl,
                      radius: BorderRadius.circular(8.h),
                      // isAsset: true,
                    ),
                  ),
                ),
                artistInfo(artwork, context, controller),
                artworkInfo(artwork),
                tags(artwork),
                tools(artwork),
                dimensions(artwork),
                comment(controller, context),
                actions(
                  controller,
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  dimensions(Artwork artwork) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          if (artwork.dimensions != null) ...[
            Text(
              'Image size',
              style: CustomTextStyles.titleMedium,
            ),
            SizedBox(width: 16.h),
            Chip(
              label: Text(
                '${artwork.dimensions!.height} x ${artwork.dimensions!.width}',
                style: theme.textTheme.labelLarge,
              ),
            ),
          ],
        ],
      ),
    );
  }

  artworkInfo(Artwork artwork) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.v),
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
                style: CustomTextStyles.titleLarge,
              ),
              Text(
                "\$${artwork.price}",
                style: CustomTextStyles.bodyLarge.copyWith(),
              ),
            ],
          ),
          SizedBox(height: 8.v),
          Text(
            artwork.description, // Use the description from the Artwork object
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyLarge.copyWith(
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }

  tags(Artwork artwork) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
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
      ),
    );
  }

  tools(Artwork artwork) {
    return Container(
      margin: EdgeInsets.only(bottom: 32.v),
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
      decoration: AppDecoration.fillSecondaryOpacity
          .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (artwork.tools != null && artwork.tools!.isNotEmpty) ...[
            Text(
              'Tools',
              style: CustomTextStyles.titleMediumLatoOnBackground,
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
    buttonStyle: CustomButtonStyles.fillPrimaryButton,
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
    margin: EdgeInsets.only(bottom: 32.v),
    padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
    decoration: AppDecoration.outlineSecondary
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
                      hintStyle: CustomTextStyles.bodyMedium,
                      textInputAction: TextInputAction.done,
                      borderDecoration:
                          TextFormFieldStyleHelper.fillSecondaryOpacity,
                      filled: true,
                      fillColor: theme.colorScheme.secondary.withOpacity(
                        0.08,
                      ),
                    ),
                    SizedBox(height: 8.v),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: theme.colorScheme.secondary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        controller.addComment(
                            controller.commentController.text, 'userName');
                      },
                      child: Text(
                        "lbl_send".tr,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: theme.colorScheme.background,
                        ),
                      ),
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

// Get.lazyPut<ArtistController>(
//     () => ArtistController(List<ArtistProfileModel>.empty(growable: true),
//         Get.find<ArtworksController>().artworks),
//     fenix: true);

artistInfo(Artwork artwork, context, controller) {
  Get.lazyPut<ArtworksController>(() => ArtworksController());
  Get.lazyPut<ArtistController>(() => ArtistController(
    artists, Get.find<ArtworksController>().artworks
  ));

  FavoriteArtworksController favoriteArtworksController = Get.find();
  ArtistController artistController = Get.find();
  ArtistProfileModel artist = artistController.getArtistByName(artwork.artist);

  return Padding(
    padding: const EdgeInsets.only(bottom: 24, top: 8),
    child: Column(
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
                  imagePath: artist.imageUrl,
                  height: 36.adaptSize,
                  width: 36.adaptSize,
                  radius: BorderRadius.circular(18.h),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h, top: 6.v, bottom: 3.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artist.name,
                        style: CustomTextStyles.bodyLarge,
                      ),
                      SizedBox(height: 4.v),
                      Obx(
                        () => Text(
                          '${artist.followsCount} Followers',
                          style: CustomTextStyles.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Obx(
              () => TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: artist.isFollowed.value
                      ? theme.colorScheme.primary
                      : null,
                  side: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  if (artist.isFollowed.value) {
                    artistController.unFollowArtist(artist);
                  } else {
                    artistController.followArtist(artist);
                  }
                },
                child: Text(
                  artist.isFollowed.value ? 'Following'.tr : 'Follow'.tr,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: artist.isFollowed.value
                        ? theme.colorScheme.background
                        : theme.colorScheme.primary,
                  ),
                ),
              ),
            )
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
                      favoriteArtworksController.toggleFavorite(artwork);
                    },
                    icon: Icon(
                      artwork.isFavorite.value
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  Text(
                    favoriteArtworksController.favoriteArtworks.length
                        .toString(),
                    style: CustomTextStyles.bodyMedium,
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
                      color: theme.colorScheme.tertiary,
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
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  Text(
                    //change to collection count
                    favoriteArtworksController.favoriteArtworks.length
                        .toString(),
                    style: CustomTextStyles.bodyMedium,
                  ),
                ],
              ),
              SizedBox(width: 20.h),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Navigates to the previous screen.
///
/// When the action is triggered, this function uses the [Get] package to
/// navigate to the previous screen in the navigation stack.

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
