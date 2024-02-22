import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/collections/collections_model.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/artworks/models/artworksmodel.dart';
import 'package:flutter/material.dart';

class ArtworkCard extends StatelessWidget {
  final Artwork artwork;
  final Collection collection;

  ArtworkCard({required this.artwork, required this.collection});

  @override
  Widget build(BuildContext context) {
    CollectionsController collectionsController = Get.find();
    return GestureDetector(
      onTap: () {
        // Navigate to ArtworkScreen
        Get.toNamed(
          AppRoutes.artworkScreen,
          arguments: artwork,
        );
      },
      onLongPress: (){
                collectionsController.removeFromCollection(collection.id, artwork);

      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                artwork.imageUrl,
              ),
            ),
            SizedBox(height: 4),
            Text(
              artwork.title,
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
