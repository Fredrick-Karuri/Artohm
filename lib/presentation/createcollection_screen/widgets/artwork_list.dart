import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artwork_screen/controller/artwork_controller.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/createcollection_screen/controller/createcollection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../artworks/models/artworksmodel.dart';

class ArtworkList extends StatelessWidget {
  final ArtworksController artworksController = Get.find<ArtworksController>();

  final CollectionFormController formController =
      Get.find<CollectionFormController>();

  // final bool showFavoritesOnly;
  // ArtworkList({this.showFavoritesOnly = false});

  @override
  Widget build(BuildContext context) {
    // final artworksToShow = showFavoritesOnly
    //     ? artworksController.favoriteArtworksList
    //     : artworksController.artworks;

    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: artworksController.artworks.length,
          itemBuilder: (context, index) {
            var artwork = artworksController.artworks[index];
            return Container(
              padding: EdgeInsets.only(right: 16.h),
              child: Column(
                children: [
                  Expanded(child: Image.asset(artwork.imageUrl)),
                  Text(artwork.title),
                  Obx(() {
                    return Checkbox(
                      value:
                          formController.selectedArtworks.contains(artwork.id),
                      onChanged: (selected) {
                        formController.toggleArtworkSelection(artwork.id);
                      },
                    );
                  }),
                ],
              ),
            );
          },
        );
       
  }
}
