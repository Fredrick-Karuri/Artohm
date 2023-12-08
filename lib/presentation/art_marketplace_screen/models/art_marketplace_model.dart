import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import 'marketplacechip_item_model.dart';

/// This class defines the variables used in the [art_marketplace_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtMarketplaceModel {
  Rx<List<MarketplaceChipItemModel>> marketplaceChipItemList = Rx(
    [
      MarketplaceChipItemModel(
        label: Rx("Paintings"),
        id: Rx("1"),
        iconData: Icons.brush,
      ),
      MarketplaceChipItemModel(
        label: Rx("Photography"),
        id: Rx("2"),
        iconData: Icons.camera,
      ),
      MarketplaceChipItemModel(
        label: Rx("Digital Art"),
        id: Rx("3"),
        iconData: Icons.art_track,
      ),
      // Add more art types here...
    ],
  );
}

