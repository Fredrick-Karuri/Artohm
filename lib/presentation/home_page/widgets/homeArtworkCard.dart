import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/presentation/createcollection_screen/widgets/create_collections_modal.dart';
import 'package:flutter/material.dart';

class HomeArtworkCardNew extends StatelessWidget {
  final Artwork artwork;

  const HomeArtworkCardNew({
    required this.artwork,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteArtworksController favoriteArtworksController =
        Get.find(); // Get the instance of LikedArtworksController
    Get.lazyPut(() => CollectionsController(
          localStorageService:
              Get.find(), // Get the instance of LocalStorageService
        ));
    CollectionsController collectionsController = Get.find();

    return GestureDetector(
      onTap: () {
        Get.to(() => ArtworkScreen(),
            arguments: artwork, binding: ArtworkBinding());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: SizedBox(
          width: 160.h,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.bottomRight,
            children: [
              CustomImageView(
                isAsset: true,
                imagePath: artwork.imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          artwork.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: theme.colorScheme.background,
                        ),
                        onPressed: () {
                          favoriteArtworksController.toggleFavorite(artwork);
                        },
                      ),
                    ),
                    // onPressed: () {
                    //   artwork.isFavorite.toggle();
                    //   favoriteArtworksController.updateFavoriteArtworks();
                    // },
                    IconButton(
                      icon: Icon(
                        Icons.collections,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (Get.isDialogOpen!) {
                          Get.back();
                        }
                        Get.dialog(
                          CollectionsModal(
                            artwork: artwork,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

                    // icon: Icon(
                    //   likedArtworksController.isLiked(artwork)
                    //       ? Icons.favorite
                    //       : Icons.favorite_border,
                    //   color: Colors.white,
                    // ),
                    // onPressed: () async {
                    //   await likedArtworksController.toggleLike(artwork);
                    // },