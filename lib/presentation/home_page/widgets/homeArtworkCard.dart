import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:artohmapp/presentation/artwork_screen/artwork_screen.dart';
import 'package:artohmapp/presentation/artwork_screen/binding/artwork_binding.dart';
import 'package:flutter/material.dart';

class HomeArtworkCardNew extends StatelessWidget {
  final Artwork artwork;

  const HomeArtworkCardNew({
    required this.artwork,
  });

  @override
  Widget build(BuildContext context) {
    LikedArtworksController likedArtworksController = Get.find(); // Get the instance of LikedArtworksController

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
                    Obx(() => IconButton(
                          icon: Icon(
                            likedArtworksController.isLiked(artwork)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            await likedArtworksController.toggleLike(artwork);
                          },
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.collections,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Handle collections icon press
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
