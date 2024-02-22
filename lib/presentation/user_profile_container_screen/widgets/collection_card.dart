import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/collections/collections_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class CollectionCard extends StatelessWidget {
  final Collection collection;

  CollectionCard({required this.collection});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CollectionDetailScreen
        Get.toNamed(
          AppRoutes.collectionDetailPage,
          arguments: collection,
        );
      },
      child: Container(
        
        color: appTheme.whiteA700,
        child: Column(
          children: [
            if (collection.artworks.isNotEmpty)
              Container(
                height: 200.v,
                child: Image.asset(collection.artworks[0].imageUrl),
              ), // Thumbnail image
            Text(collection.name), // Collection name
            Text('${collection.artworks.length} artworks'), // Number of artworks
          ],
        ),
      ),
    );
  }
}

