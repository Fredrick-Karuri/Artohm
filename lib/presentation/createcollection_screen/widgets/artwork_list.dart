import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/presentation/artworks/controller/artworks_controller.dart';
import 'package:artohmapp/presentation/createcollection_screen/controller/createcollection_controller.dart';
import 'package:flutter/material.dart';

class ArtworkList extends StatelessWidget {
  final ArtworksController artworksController = Get.find<ArtworksController>();

  final CollectionFormController formController =
      Get.find<CollectionFormController>();

  @override
  Widget build(BuildContext context) {
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
                  value: formController.selectedArtworks.contains(artwork.id),
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
