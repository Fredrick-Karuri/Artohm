import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import 'marketplacechip_item_model.dart';

/// This class defines the variables used in the [art_marketplace_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MarketplaceModel {
  Rx<List<MarketplaceChipItemModel>> marketplaceChipItemList = Rx(
    [
      MarketplaceChipItemModel(
        label: Rx("All"),
        id: Rx("all"),
        iconData: Icons.all_inclusive,
        isSelected: Rx(true),
      ),
      MarketplaceChipItemModel(
        label: Rx("Paintings"),
        id: Rx("ptg"),
        iconData: Icons.brush,
      ),
      MarketplaceChipItemModel(
        label: Rx("Photography"),
        id: Rx("pho"),
        iconData: Icons.camera,
      ),
      MarketplaceChipItemModel(
        label: Rx("Digital Art"),
        id: Rx("dgt"),
        iconData: Icons.art_track,
      ),
      // Add more art types here...
    ],
  );
  Rx<List<MarketPlaceArtwork>> artList = Rx(
    [
      MarketPlaceArtwork(
        imagePath: ImageConstant.imgRectangle1120,
        svgPath: ImageConstant.imgIconsWhiteA700,
        title: "lbl_sunset_serenity",
        artist: "lbl_emily_davis",
        price: "lbl_620",
        // id: "1",
        type: "ptg",
      ),
      MarketPlaceArtwork(
        imagePath: ImageConstant.imgRectangle1120,
        svgPath: ImageConstant.imgIconsWhiteA700,
        title: "lbl_sunset_serenity",
        artist: "lbl_emily_davis",
        price: "lbl_620",
        // id: "2",
        type: "dgt",
      ),
      MarketPlaceArtwork(
        imagePath: ImageConstant.imgRectangle1120,
        svgPath: ImageConstant.imgIconsWhiteA700,
        title: "lbl_sunset_serenity",
        artist: "lbl_emily_davis",
        price: "lbl_620",
        // id: "2",
        type: "pho",
      ),MarketPlaceArtwork(
        imagePath: ImageConstant.imgRectangle1120,
        svgPath: ImageConstant.imgIconsWhiteA700,
        title: "lbl_sunset_serenity",
        artist: "lbl_emily_davis",
        price: "lbl_620",
        // id: "2",
        type: "pho",
      ),
      // Add more artworks here...
    ],
  );
}

class MarketPlaceArtwork {
  final String imagePath;
  final String svgPath;
  final String title;
  final String artist;
  final String price;
  // final String id;
  final String type;

  MarketPlaceArtwork({
    required this.imagePath,
    required this.svgPath,
    required this.title,
    required this.artist,
    required this.price,
    // required this.id,
    required this.type,
  });
}
