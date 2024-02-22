import 'package:artohmapp/core/app_export.dart';
import 'package:artohmapp/data/models/collections/collections_model.dart';
import 'package:artohmapp/widgets/custom_appbar_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import 'collection_artwork.dart';

class CollectionDetailScreen extends StatelessWidget {
  final Collection collection;

  CollectionDetailScreen({required this.collection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarComponent(
        onBackPressed: () {
          Get.back();
        },
        title: collection.name,
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 16, left: 8, right: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // crossAxisSpacing: 10,
          childAspectRatio: 0.8,
          mainAxisSpacing: 16,
        ),
        itemCount: collection.artworks.length,
        itemBuilder: (context, index) {
          return ArtworkCard( 
            collection: collection,
            
            artwork: collection.artworks[index]);
        },
      ),
    );
  }
}
