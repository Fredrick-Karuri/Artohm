import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:artohmapp/widgets/app_bar/custom_app_bar.dart';
import 'package:artohmapp/widgets/custom_elevated_button.dart';
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

    final artworksController = Get.put(ArtworksController());

    return GestureDetector(
      onTap: () {
        Get.to(() => ArtworkScreen(),
            arguments: artwork, binding: ArtworkBinding());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SizedBox(
          height: 200.v,
          width: 160.h,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                artwork.imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 4),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => IconButton(
                        icon: Icon(
                          artwork.isFavorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                        
                        onPressed: () {
                          artwork.isFavorite.toggle();
                          favoriteArtworksController.updateFavoriteArtworks();
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.collections,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        collectionsModal(context, collectionsController);
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

  Future<dynamic> collectionsModal(
      BuildContext context, CollectionsController collectionsController) {
    return showModalBottomSheet(
      backgroundColor: appTheme.pink50,
      context: context,
      builder: (context) {
        String collectionName = '';
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Collections',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    children: collectionsController.collections
                        .map((collection) => ActionChip(
                              backgroundColor: appTheme.whiteA700,
                              label: Text(collection.name),
                              onPressed: () {
                                collectionsController.addToCollection(
                                    collection.id, artwork);
                                Navigator.pop(context);
                              },
                            ))
                        .toList(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  collectionName = value;
                },
                decoration: InputDecoration(
                  labelText: 'New Collection Name',
                ),
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                text: 'Create New Collection',
                onTap: () {
                  collectionsController.createCollection(
                    collectionName,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
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